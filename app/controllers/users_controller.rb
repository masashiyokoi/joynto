class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :request_match, :accept_match]
  before_action :check_current_user, only: [:edit, :update, :destroy]

  def index
    @q = User.opponents(current_user).order(membership_type: :desc).ransack(params[:q])
    @users = @q.result.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def request_match
    match = current_user.matches.create(match_type: 'direct_match')
    match.user_matches.create(user: @user)
    NotificationMailer.send_request_message_to_user(current_user, @user).deliver

    redirect_to @user, notice: "You follow user"
  end

  def accept_match
    @match = current_user.matches.find(params[:match_id])
    raise 'asfasf' unless @match.users.include? @user
    @match.update(match_status: :joynted)
    @match.notifications.create(target: @user)
    NotificationMailer.match_message_create(current_user, @user).deliver
  end

  def block
  end

  def read_notification
    @match = current_user.matches.find(params[:match_id])
    @match.notifications.unread.find_by(target: current_user).update(read: true)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def check_current_user
    unless @user == current_user
      redirect_to root_path, alert: 'no permission'
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile, :image, :match_id)
  end
end
