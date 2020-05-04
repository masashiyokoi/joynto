class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :follow, :stop_following]
  before_action :check_current_user, only: [:edit, :update, :destroy]

  def index
    @users = User.order("RAND()")
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

  def follow
    current_user.follow @user
    NotificationMailer.send_follow_message_to_user(current_user, @user).deliver

    if @user.following? current_user

      Channel::DirectMessage.create_follows([current_user, @user])

      NotificationMailer.direct_message_create(current_user, @user).deliver
    end

    redirect_to @user, notice: "You follow user"
  end

  def stop_following
    if @user.following? current_user
      Channel::DirectMessage.delete_follows([current_user, @user])
    end
    current_user.stop_following @user
    redirect_to @user, notice: "You stop_following this!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def check_current_user
      unless @user == current_user
        redirect_to root_path, alert: 'no permission'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :profile, :image)
    end
end
