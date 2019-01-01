class MypagesController < ApplicationController
  before_action :set_user, only: [:show]

  def index
  end

  def show
  end

  private

  def set_user
    @user = current_user
  end
end
