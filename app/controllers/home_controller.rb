class HomeController < ApplicationController
  def index
    @project_activities = PublicActivity::Activity.all.where(key: 'project.create').order(id: :desc)
    @messages_with_image = Message.has_image.joins(:channel).where(channels: { type: 'Channel::Times' }).order(id: :desc)
    @messages = Message.joins(:channel).where(channels: { type: 'Channel::Times' }).order(id: :desc)
  end
end
