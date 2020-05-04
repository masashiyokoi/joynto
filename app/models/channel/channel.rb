class Channel < ApplicationRecord
  has_many :messages, dependent: :destroy

  acts_as_followable
end
