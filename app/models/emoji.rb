class Emoji < ApplicationRecord
  has_many :votes, foreign_key: :vote_scope

  mount_uploader :image, EmojiUploader
end
