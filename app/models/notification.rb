class Notification < ApplicationRecord
  include PublicActivity::Model

  belongs_to :notifiable, polymorphic: true
  belongs_to :target, polymorphic: true

  after_create :notify_to_user

  tracked

  scope :unread, ->() { where(read: false) }

  def notify_to_user
    
  end
end
