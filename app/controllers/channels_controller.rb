class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]

  def index
    @channels = Channel.joins(:channel_users)
      .where(channel_users: { user_id: current_user.id })
  end

  def show
    @new_message = message.new
    @messages = message.where(channel_id: @channel.id)
  end

  private

  def set_channel
    @channel = Channel.find(params[:id])
  end
end
