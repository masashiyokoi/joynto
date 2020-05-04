namespace :channel_type_migration do
  task execute: :environment do
    Channel.inheritance_column = :_type_disabled

    Channel.all.each do |channel|
      case channel.kind
      when 1
        channel.update(type: 'Channel::times')
      when 2
        channel.update(type: 'Channel::DirectMessage')
      when 3
        channel.update(type: 'Channel::Projects')
      end
    end

    Channel.inheritance_column = 'type'

    Follow.all.each do |follow|
      if follow.followable_type == 'Channel'
        case follow.followable.kind
        when 1
          follow.update(followable_type: 'Channel::times')
        when 2
          follow.update(followable_type: 'Channel::DirectMessage')
        when 3
          follow.update(followable_type: 'Channel::Projects')
        end
      end
    end

    PublicActivity::Activity.all.each do |activity|
      if activity.trackable_type == 'Channel'
        case activity.trackable.kind
        when 1
          follow.update(trackable_type: 'Channel::times')
        when 2
          follow.update(trackable_type: 'Channel::DirectMessage')
        when 3
          follow.update(trackable_type: 'Channel::Projects')
        end
      end
    end
  end
end
