
namespace :channel_migration do
  task execute: :environment do
    User.all.each do |user|
      Channel.create(user_id: user.id, kind: :times) unless user.channel_times
    end

    Message.where(channel_id: nil).each do |message|
      message.update(channel_id: Channel.times.find_by(user_id: message.user_id).id)
    end
  end
end
