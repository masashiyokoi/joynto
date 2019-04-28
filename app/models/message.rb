class Message < ApplicationRecord
  include PublicActivity::Model
  tracked

  belongs_to :user

  acts_as_votable
  acts_as_commentable

  validates :user_id, presence: true

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
end
