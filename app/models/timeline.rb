class Timeline < ApplicationRecord
  include PublicActivity::Model
  tracked

  acts_as_votable

  validates :user_id, presence: true
end
