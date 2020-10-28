class Notification < ApplicationRecord
  include PublicActivity::Model

  belongs_to :notifiable, polymorphic: true
  belongs_to :target, polymorphic: true

  tracked

  scope :unread, ->() { where(read: false) }
end
