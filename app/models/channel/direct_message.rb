class Channel::DirectMessage < Channel
  def self.create_follows(users)
    channel = self.create

    users.each do |user|
      user.follow channel
    end
  end

  def self.delete_follows(users)
    channel = users[0].following_by_type('Channel') && users[1].following_by_type('Channel').first

    users.each do |user|
      user.stop_following channel
    end

    channel.destroy
  end
end
