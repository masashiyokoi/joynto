class ChannelsController < ApplicationController
  before_action :set_timeline, only: [:show, :edit, :update, :destroy, :like, :unvote]
  before_action :check_current_user, only: [:edit, :update, :destroy]

  def index
    @channels = Channel.where(type: 'private')
      .joins(:channel_users)
      .where(channel_users: { user_id: current_user.id })
  end
end
