class Warrant < ApplicationRecord
  include PublicActivity::Model

  belongs_to :issuer_user, foreign_key: :issuer_user_id, class_name: 'User'
  belongs_to :owner_user, foreign_key: :owner_user_id, class_name: 'User'

  enum status: { draft: 0, proposed: 1, issued: 2, exercised: 11 }

  tracked

  validates :start_datetime, presence: true, if: -> { end_datetime.present? }
  validates :end_datetime, presence: true, if: -> { start_datetime.present? }
  validate :start_must_be_earlier_than_end
  validate :check_match_users

  before_save :set_price

  def self.total_price_group_by_start_month(warrants)
    warrants.where.not(start_datetime: nil, price: nil)
      .group("DATE_FORMAT(start_datetime, '%Y%m')")
      .select("DATE_FORMAT(start_datetime, '%Y%m') as month, sum(price) as price")
  end

  def calc_price
    return unless end_datetime && start_datetime && price_per_hour
    (end_datetime - start_datetime) / 60 / 60 * price_per_hour
  end

  private

  def set_price
    self.price = calc_price
  end

  def start_must_be_earlier_than_end
    return unless start_datetime || end_datetime
    unless start_datetime < end_datetime
      errors.add(:start_datetime, "Start time must be earlier than end time")
    end
  end

  def check_match_users
    unless (owner_user.matches & issuer_user.matches).present?
      errors.add(:base, "not match users")
    end
  end
end
