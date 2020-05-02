class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy, :like, :unvote]
  before_action :check_current_user, only: [:edit, :update, :destroy]

  # GET /words
  # GET /words.json
  def index
    @q = Word.ransack(params[:q])
    @words = @q.result.page(params[:page]).per(24).order(id: :desc)
    @new_word = Word.new
  end

  def images
    @has_image_words = Word.has_image
  end

  def users
    @words = Word.is_channel_times.where(user_id: params[:user_id]).page(params[:page]).per(24).order(id: :desc)
    @new_word = Word.new
  end

  def followings
    @words = Word.is_channel_times
      .where(user_id: current_user.all_following_users.pluck(:id))
      .page(params[:page]).per(24).order(id: :desc)
  end

  # GET /words/1
  # GET /words/1.json
  def show
    if user_signed_in?
      @new_comment = Comment.build_from(@word, current_user.id, "")
    end
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)
    @word.user_id = current_user.id

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'word was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word, notice: 'word was successfully updated.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: 'word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @word.voted_by voter: current_user, :duplicate => true, vote: 'good'
    @word.create_activity key: 'word.liked', owner: current_user
    NotificationMailer.send_confirm_to_user(current_user, @word.user).deliver
    redirect_to @word, notice: "You liked this!"
  end

  def unvote
    @word.voted_by voter: current_user, :duplicate => true, vote: 'bad'
    redirect_to @word, notice: "You disliked this!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    def check_current_user
      unless @word.user == current_user
        redirect_to root_path, alert: 'no permission'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:name, :description)
    end
end
