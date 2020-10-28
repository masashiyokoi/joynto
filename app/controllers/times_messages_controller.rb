class TimesMessagesController < ApplicationController
  before_action :set_times_message, only: [:show, :edit, :update, :destroy, :like, :unvote]
  before_action :check_current_user, only: [:edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @q = TimesMessage.ransack(params[:q])
    @times_messages = @q.result.page(params[:page]).per(24).order(id: :desc)
    @new_message = TimesMessage.new
  end

  def images
    @has_image_messages = TimesMessage.has_image.order(id: :desc)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @times_message = TimesMessage.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @times_message = TimesMessage.new(times_message_params)
    @times_message.user_id = current_user.id

    respond_to do |format|
      if @times_message.save
        format.html { redirect_to @times_message, notice: 'times_message was successfully created.' }
        format.json { render :show, status: :created, location: @times_message }
      else
        format.html { render :new }
        format.json { render json: @times_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @times_message.update(times_message_params)
        format.html { redirect_to @times_message, notice: 'times_message was successfully updated.' }
        format.json { render :show, status: :ok, location: @times_message }
      else
        format.html { render :edit }
        format.json { render json: @times_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @times_message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'times_message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @times_message.liked_by current_user
    @times_message.create_activity key: 'times_message.liked', owner: current_user
    NotificationMailer.send_confirm_to_user(current_user, @times_message.user).deliver
    redirect_to @times_message, notice: "You liked this!"
  end

  def unvote
    @times_message.disliked_by current_user
    redirect_to @times_message, notice: "You disliked this!"
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_times_message
    @times_message = TimesMessage.find(params[:id])
  end

  def check_current_user
    unless @times_message.user == current_user
      redirect_to root_path, alert: 'no permission'
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def times_message_params
    params.require(:times_message).permit(:type, :content, :image, :video)
  end
end
