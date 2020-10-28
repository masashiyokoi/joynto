class MatchMessagesController < ApplicationController
  before_action :set_match
  before_action :set_match_message, only: [:edit, :update, :destroy]
  before_action :check_user_membership, only: [:new, :create, :edit, :update, :destroy]

  def index
    @q = @match.match_messages.ransack(params[:q])
    @match_messages = @q.result.page(params[:page]).per(24).order(id: :asc)
    @new_message = @match.match_messages.new
  end

  def show
  end

  def new
    @match_message = @match.match_messages.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @match_message = @match.match_messages.build(match_message_params)
    @match_message.user_id = current_user.id

    respond_to do |format|
      if @match_message.save
        format.html { redirect_to @match, notice: 'match_message was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @match_message.update(match_message_params)
        format.html { redirect_to @match_message, notice: 'match_message was successfully updated.' }
        format.json { render :show, status: :ok, location: @match_message }
      else
        format.html { render :edit }
        format.json { render json: @match_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @match_message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'match_message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_match
    @match = Match.find(params[:match_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_match_message
    @match_message = @match.match_messages.find(params[:id])
  end

  def check_user_membership
    unless current_user.can_send_message_to_request_match?
      redirect_to root_path, alert: 'no permission'
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def match_message_params
    params.require(:match_message).permit(:type, :content, :image, :video)
  end
end
