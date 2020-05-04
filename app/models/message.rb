class Message < ApplicationRecord
  include PublicActivity::Model
  belongs_to :user
  belongs_to :channel
  has_many :notifications, as: :notifiable

  after_create :notify_following_users

  acts_as_votable
  acts_as_commentable
  tracked

  validates :user_id, presence: true
  validates :channel_id, presence: true
  validates :content, presence: true

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  scope :is_channel_times, ->() { joins(:channel).where(channels: { type: 'Channel::times' }) }
  scope :has_image, ->() { where.not(image: nil) }

  private

  def notify_following_users
    return unless channel.times?
    user.user_followers.each do |follow_user|
      NotificationMailer.times_message_create(user, follow_user, id).deliver
    end
  end
end
