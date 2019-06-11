class Channel < ApplicationRecord

  enum kind: {
    times: 1,
    direct_message: 2,
    project: 3,
  }

  has_many :messages

  acts_as_followable

  def self.create_direct(users)
    channel = self.create(
      kind: :direct_message
    )

    users.each do |user|
      user.follow channel
    end
  end

  def self.delete_direct(users)
    channel = users[0].following_by_type('Channel').direct_message && users[1].following_by_type('Channel').direct_message.first

    users.each do |user|
      user.stop_following channel
    end

    channel.destroy
  end
end
