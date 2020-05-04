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
  end

  task fix: :environment do
    Follow.all.each do |follow|
      if follow.followable_type == 'DirectMessage'
        follow.update(followable_type: 'Channel')
      end
    end
  end
end
