class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy, :like, :unvote]
  before_action :check_current_user, only: [:edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.page(params[:page]).per(24).order(id: :desc)
    @new_message = Message.new
  end

  def users
    @messages = Message.where(user_id: params[:user_id]).page(params[:page]).per(24).order(id: :desc)
    @new_message = Message.new
  end

  def followings
    @messages = Message.where(user_id: current_user.all_following_users.pluck(:id)).order(id: :desc)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    if user_signed_in?
      @new_comment = Comment.build_from(@message, current_user.id, "")
    end
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'message was successfully updated.' }
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

  def like
    @message.liked_by current_user
    @message.create_activity key: 'message.liked', owner: current_user
    NotificationMailer.send_confirm_to_user(current_user, @message.user).deliver
    redirect_to @message, notice: "You liked this!"
  end

  def unvote
    @message.disliked_by current_user
    redirect_to @message, notice: "You disliked this!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    def check_current_user
      unless @message.user == current_user
        redirect_to root_path, alert: 'no permission'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:type, :content, :image, :video)
    end
end
