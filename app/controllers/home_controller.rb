class HomeController < ApplicationController
  def index
    @project_activities = PublicActivity::Activity.all.where(key: 'project.create').order(id: :desc)
    @messages_with_image = Message.joins(:channel_times).has_image.order(id: :desc)
    @messages = Message.joins(:channel_times).order(id: :desc)
  end
end
