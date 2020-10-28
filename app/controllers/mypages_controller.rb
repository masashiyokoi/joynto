class MypagesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @activities = PublicActivity::Activity.all
    @ern_warrants = current_user.owner_warrants
    @requesting_matches
    @requested_matches
    @total_ern_warrants_per_month = Warrant.total_price_group_by_start_month current_user.owner_warrants
  end

  def payment
    @activities = PublicActivity::Activity.all
    @warrants = current_user.owner_warrants
    @total_ern_warrants_per_month = Warrant.total_price_group_by_start_month current_user.owner_warrants
  end
end
