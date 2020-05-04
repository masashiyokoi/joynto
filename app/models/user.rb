class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :confirmable

  has_many :messages
  has_many :notifications, as: :target
  has_one :channel_times, -> { times }, class_name: 'Channel::times'

  validates :name,
    presence: true,
    uniqueness: true,
    length: { maximum: 16 },
    format: { with: /\A[a-z0-9]+\z/i, message: "Only alphanumeric characters can be used"  }
  after_create :create_timeline
  before_save :check_invitation_user_regist

  acts_as_voter
  acts_as_followable
  acts_as_follower

  mount_uploader :image, ImageUploader

  scope :active, ->() { where.not(invitation_accepted_at: nil) }

  def following_each_users
    all_following & followers
  end

  def remember_me
    true
  end

  private

  def create_timeline
    return if channel_times
    channel = Channel::Times.create(
      user_id: id
    )
  end

  def check_invitation_user_regist
    return unless invitation_accepted_at_changed? || confirmed_at_changed?
    send_mail_to_existing_users
    return unless invitation_accepted_at_changed?

    follow invited_by
    invited_by.follow self

    Channel::DirectMessage.create_follows([self, invited_by])
  end

  def send_mail_to_existing_users
    User.active.each do |u|
      NotificationMailer.new_user_announce(self, u).deliver
    end
  end
end
