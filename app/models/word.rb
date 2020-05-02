class Word < ApplicationRecord
  include PublicActivity::Model

  belongs_to :user
  acts_as_votable
  acts_as_commentable
  tracked

  validates :user_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
end
