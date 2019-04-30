class Message < ApplicationRecord
  include PublicActivity::Model
  tracked

  belongs_to :user
  belongs_to :messageable, polymorphic: true

  acts_as_votable
  acts_as_commentable

  validates :user_id, presence: true

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  scope :is_timeline, ->() { where(messageable_type: 'Channel::Timeline') }
end
