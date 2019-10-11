class HomeController < ApplicationController
  def index
    @project_activities = PublicActivity::Activity.all.where(key: 'project.create').order(id: :desc)
    @event_activities = PublicActivity::Activity.all.where(key: 'event.create').order(id: :desc)
    @message_activities = PublicActivity::Activity.all.where(key: 'message.create').order(id: :desc)
  end
end
