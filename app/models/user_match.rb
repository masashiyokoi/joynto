class UserMatch < ApplicationRecord
  belongs_to :user
  belongs_to :match

  validate :max_two_user_on_match_message
  validates :match_id, uniqueness: { scope: :user_id }
  validates :user_id, uniqueness: { scope: :match_id }

  enum role: { resident: 0, room_keeper: 1, box_master: 2 }# TODO: change column to role

  private

  def max_two_user_on_match_message
    return unless match.match_type == 'match_message'
    # TODO: need to fix logic
    if match.users.where.not(id: user_id).count > 2
      errors.add(:user_id, "match_message match cannot have more than 2 users")
    end
  end
end
