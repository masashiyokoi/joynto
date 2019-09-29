class Project < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :tasks

  enum status: { ready: 1, doing: 2, completed: 10 }

  mount_uploader :image, ImageUploader

  scope :not_completed, ->() { where.not(status: statuses[:completed]) }
end
