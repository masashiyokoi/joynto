class HomeController < ApplicationController
  def index
    @project_activities = PublicActivity::Activity.all.where(key: 'project.create')
    @event_activities = PublicActivity::Activity.all.where(key: 'event.create')
  end
end
