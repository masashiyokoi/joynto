class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable

  has_many :messages
  has_one :channel_timeline, class_name: 'Channel::Timeline'
  has_many :channel_users
  has_many :channels, through: :channel_users

  validates :name, presence: true, uniqueness: true

  after_create :create_timeline

  acts_as_voter
  acts_as_followable
  acts_as_follower

  mount_uploader :image, ImageUploader

  def following_each_users
    all_following & followers
  end

  private

  def create_timeline
    return if timeline
    Channel::Timeline.create(user_id: id)
  end
end
