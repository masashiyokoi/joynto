class Channel::Directs::MessagesController < ApplicationController
  before_action :set_channel, only: [:index, :create]
  before_action :check_current_user, only: [:index, :create]

  def index
    @new_message = Message.new
    @messages = @channel.messages.order(id: :desc).page(params[:page]).per(24)
  end

  def show
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.channel_id = @channel.id
    respond_to do |format|
      if @message.save
        @channel.user_followers.where.not(id: current_user.id ).each do |user|
          NotificationMailer.direct_message_to_user(current_user, user).deliver
        end
        format.html { redirect_to channel_direct_messages_path(@channel), notice: 'message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { redirect_to channel_direct_messages_path(@channel), alert: 'message was not successfully created.' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to channelemessage, notice: 'message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.direct_message.find(params[:direct_id])
    end

    def check_current_user
      unless @channel.user_followers.pluck(:id).include? current_user.id
        redirect_to root_path, alert: 'no permission'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:type, :content, :image)
    end
end
