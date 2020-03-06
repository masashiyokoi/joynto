class HomeController < ApplicationController
  def index
    @project_activities = PublicActivity::Activity.all.where(key: 'project.create').order(id: :desc)
    @event_activities = PublicActivity::Activity.all.where(key: 'event.create').order(id: :desc)
    @messages = Message.joins(:channel).joins(:activities).where(activities: { key: 'message.create' }).where(channels: { kind: Channel.kinds[:times] })
  end
end
