class ChannelsController < ApplicationController
  before_action :check_current_user

  def index
    @channels = Channel.joins(:channel_users)
      .where(channel_users: { user_id: current_user.id })
  end
end
