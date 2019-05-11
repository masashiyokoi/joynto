class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable

  has_many :messages
  has_many :channel_users
  has_one :channel_times, -> { times }, class_name: 'Channel'

  validates :name, presence: true, uniqueness: true

  after_create :create_timeline
  before_save :bulk_send_new_user_announce

  acts_as_voter
  acts_as_followable
  acts_as_follower

  mount_uploader :image, ImageUploader

  scope :active, ->() { where.not(invitation_accepted_at: nil) }

  def following_each_users
    all_following & followers
  end

  private

  def create_timeline
    return if channel_times
    channel = Channel.create(
      kind: :times,
      user_id: id
    )
  end

  def bulk_send_new_user_announce
    return unless invitation_accepted_at_changed?
    User.active.each do |u|
      NotificationMailer.new_user_announce(self, u).deliver
    end
  end
end
