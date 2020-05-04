class Channel::DirectsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]

  def index
    @channels = current_user.following_by_type('Channel')
  end

  def show
    @new_message = Message.new
    @messages = Message.where(channel_id: @channel.id).page(params[:page]).per(24).order(id: :desc)
  end

  private

  def set_channel
    @channel = Channel::DirectMessage.find(params[:id])
  end
end
