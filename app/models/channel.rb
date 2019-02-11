class Channel < ApplicationRecord
  belongs_to :user
  has_many :channel_users
  has_many :users, through: :channel_users

  self.inheritance_column = :_type_disabled
end
