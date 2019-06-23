class Message < ApplicationRecord
  include PublicActivity::Model
  tracked

  belongs_to :user
  belongs_to :channel

  after_create :notify_following_users

  acts_as_votable
  acts_as_commentable

  validates :user_id, presence: true

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  scope :is_channel_times, ->() { joins(:channel).where(channels: { kind: :times }) }

  private

  def notify_following_users
    return unless channel.times?
    user.user_followers.each do |follow_user|
      NotificationMailer.times_message_create(user, follow_user, id).deliver
    end
  end
end
