class Match < ApplicationRecord
  has_many :match_messages
  has_many :user_matches
  has_many :users, through: :user_matches
  has_many :notifications, as: :notifiable

  enum match_type: { direct_match: 1, group_match: 2 }
  enum match_status: { created: 0, joynted: 1, block: 10 }

  def has_message_notification?(user)
    match_messages.joins(:notifications).where(notifications: { target: user, read: false }).present?
  end

  def warrant_match?
    return unless direct_match?
    users.pluck(:membership_type).sort == ['angel', 'seed'].sort
  end
end
