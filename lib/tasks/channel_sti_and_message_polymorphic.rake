
namespace :channel_sti_and_message_polymorphic do
  task execute: :environment do
    User.all.each do |user|
      Channel::Timeline.create(user_id: user.id) unless user.channel_timeline
    end

    Message.where(channel_id: nil).each do |message|
      message.update(channel_id: Channel::Timeline.find_by(user_id: message.user_id).id)
    end

    Message.all.each do |message|
      message.update(
        messageable_type: Channel.find_by(user_id: message.user_id).type,
        messageable_id: Channel.find_by(user_id: message.user_id).id
      )
    end
  end
end
