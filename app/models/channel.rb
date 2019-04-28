class Channel < ApplicationRecord
  has_many :channel_users
  has_many :users, through: :channel_users

  self.inheritance_column = :_type_disabled
end
