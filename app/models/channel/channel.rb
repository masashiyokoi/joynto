class Channel < ApplicationRecord
  has_many :messages

  acts_as_followable
end
