class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable

  has_many :messages

  validates :name, presence: true, uniqueness: true

  acts_as_voter
  acts_as_followable
  acts_as_follower

  mount_uploader :image, ImageUploader

  def following_each_users
    all_following & followers
  end
end
