class HomeController < ApplicationController
  def index
    @project_activities = PublicActivity::Activity.all.where(key: 'project.create').order(id: :desc)
    @event_activities = PublicActivity::Activity.all.where(key: 'event.create').order(id: :desc)
    @messages = Message.has_image.joins(:channel).where(channels: { kind: Channel.kinds[:times] }).order(id: :desc)
  end
end
