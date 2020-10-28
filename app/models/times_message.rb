class TimesMessage < ApplicationRecord
  include PublicActivity::Model

  belongs_to :user

  acts_as_votable
  tracked

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  scope :has_image, ->() { where.not(image: nil) }
end
