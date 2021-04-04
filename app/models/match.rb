class Match < ApplicationRecord
  has_many :user_matches
  has_many :users, through: :user_matches
  has_many :notifications, as: :notifiable
  has_many :match_messages

  enum match_type: { chat_room: 1, warrant: 2, box: 3 }
  enum match_status: { pending: 0, joynted: 1, block: 10 }

  def has_message_notification?(user)
    match_messages.joins(:notifications).where(notifications: { target: user, read: false }).present?
  end
end
