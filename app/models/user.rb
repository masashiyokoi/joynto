class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :confirmable

  has_many :messages
  has_many :notifications, as: :target
  has_many :projects, foreign_key: :owner_id
  has_many :user_matches
  has_many :user_request_matches, -> { where(process_type: :request) }, class_name: 'UserMatch'
  has_many :user_accept_matches, -> { where(process_type: :accept) }, class_name: 'UserMatch'
  has_many :matches, through: :user_matches
  has_many :request_matches, through: :user_request_matches, source: :match
  has_many :accept_matches, through: :user_accept_matches, source: :match
  has_many :times_messages
  has_many :match_messages
  has_many :issuer_warrants, class_name: 'Warrant', foreign_key: :issuer_user_id
  has_many :owner_warrants, class_name: 'Warrant', foreign_key: :owner_user_id

  enum membership_type: { attendee: 0, member: 1, angel: 2, seed: 11 }

  validates :name,
    presence: true,
    uniqueness: true,
    length: { maximum: 16 },
    format: { with: /\A[a-z0-9]+\z/i, message: "Only alphanumeric characters can be used"  }

  before_save :check_invitation_user_regist

  acts_as_voter

  mount_uploader :image, ImageUploader

  scope :active, ->() { where.not(invitation_accepted_at: nil) }

  def request_matches?(user)
    UserMatch.where(user: user, match: matches.pluck(:id)).joins(:match).where(matches: { match_status: :created }).present?
  end

  def matched?(user)
    UserMatch.where(user: user, match: matches.pluck(:id)).joins(:match).where(matches: { match_status: :connected }).present?
  end

  def can_send_message_to_match? match
    if membership_type != 'attendee'
      true
    else
      !requested_to_match? match
    end
  end

  def requested_to_match? match
    user_matches.joins(:match).where(process_type: :request).present?
  end

  def direct_match_user match
    return unless match.match_type == 'direct_match'
    (match.users - [self])[0]
  end

  private

  def check_invitation_user_regist
    return unless invitation_accepted_at_changed? || confirmed_at_changed?
    send_mail_to_active_users
  end

  def send_mail_to_active_users
    User.active.each do |u|
      NotificationMailer.new_user_announce(self, u).deliver
    end
  end
end
