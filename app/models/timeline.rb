class Timeline < ApplicationRecord
  include PublicActivity::Model
  tracked

  belongs_to :user

  acts_as_votable

  validates :user_id, presence: true
end
