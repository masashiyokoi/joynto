class Channel::DirectMessage < Channel
  def self.create_direct(users)
    channel = self.create

    users.each do |user|
      user.follow channel
    end
  end

  def self.delete_direct(users)
    channel = users[0].following_by_type('Channel::direct_message').direct_message && users[1].following_by_type('Channel::direct_message').direct_message.first

    users.each do |user|
      user.stop_following channel
    end

    channel.destroy
  end
end
