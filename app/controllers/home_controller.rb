class HomeController < ApplicationController
  def index
    @project_activities = PublicActivity::Activity.all.where(key: 'project.create')
    @event_activities = PublicActivity::Activity.all.where(key: 'event.create')
    @message_activities = PublicActivity::Activity.all.where(key: 'message.create')
  end
end
