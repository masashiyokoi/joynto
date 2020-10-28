class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_match, only: [:show, :accept_match]

  def index
    @q = current_user.matches.ransack(params[:q])
    @matches = @q.result.page(params[:page]).per(24).order(id: :desc)
  end

  def index_requested
    @q = current_user.matches.ransack(params[:q])
    @matches = @q.result.where(connected: false)
    render :index
  end

  def show
    if @match.notifications.unread.find_by(target: current_user).present?
      @match.notifications.unread.find_by(target: current_user).update(read: true)
    end
    @match_messages = @match.match_messages.order(id: :desc)
  end

  def accept_match
    raise 'asefasfa' unless @match.user_matches.pluck(:id).include? params[:request_user_id]
    @match.update(connected: true)
    NotificationMailer.match_message_create(current_user, @user).deliver
  end

  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def block
  end

  private

  def set_match
    @match = Match.joins(:user_matches).where(user_matches: { user: current_user }).find(params[:id])
  end
end
