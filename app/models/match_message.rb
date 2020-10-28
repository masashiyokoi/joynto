class MatchMessage < ApplicationRecord
  belongs_to :user
  belongs_to :match
  belongs_to :warrant, optional: true
  has_many :notifications, as: :notifiable

  validate :user_is_in_match

  after_create :notinotinoti

  private

  def user_is_in_match
    unless match.users.include?(user)
      errors.add(:user_id, 'invalid user_id')
    end
  end

  def other_users
    return unless match.direct_match?
    match.users.where.not(id: user.id)
  end

  def notinotinoti
    other_users.each do |u|
      notifications.create(target: u)
      NotificationMailer.match_message_to_user(user, u, match).deliver
    end
  end
end
