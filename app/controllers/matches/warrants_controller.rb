class Matches::WarrantsController < ApplicationController
  before_action :set_match
  before_action :set_warrant, only: [:show, :edit, :update, :destroy]

  # GET /warrants
  # GET /warrants.json
  def index
    match_user = current_user.direct_match_user @match
    @warrants = current_user.owner_warrants.where(issuer_user: match_user)
  end

  def index_benefit
    match_user = current_user.direct_match_user @match
    @warrants = Warrant.where(issuer_user: match_userr, owner_user: current_user)
  end

  # GET /warrants/1
  # GET /warrants/1.json
  def show
  end

  # GET /warrants/new
  def new
    @warrant = current_user.owner_warrants.new(issuer_user: current_user.direct_match_user(@match))
  end

  # GET /warrants/1/edit
  def edit
  end

  def propose
    raise '' unless @warrant.owner_user == current_user
    @warrant.update(status: :proposed)
    NotificationMailer.match_message_create(current_user, @user).deliver
  end

  def accept_proposal
    raise '' unless @warrant.issuer_user == current_user
    @warrant.update(status: :issued)
    NotificationMailer.match_message_create(current_user, @user).deliver
  end

  def calcel_proposal
    raise '' unless @warrant.issuer_user == current_user || @warrant.owner_user == current_user
    @warrant.update(status: :proposed)
    NotificationMailer.match_message_create(current_user, @user).deliver
  end

  def exercise
    raise '' unless @warrant.issuer_user == current_user
    @warrant.update(status: :exercised)
    NotificationMailer.match_message_create(current_user, @user).deliver
  end

  # POST /warrants
  # POST /warrants.json
  def create
    @warrant = current_user.owner_warrants.new(issuer_user: current_user.direct_match_user(@match))
    @warrant.assign_attributes(warrant_params)

    respond_to do |format|
      if @warrant.save
        current_user.match_messages.create(match: @match, content: 'warrant作成', warrant: @warrant)
        NotificationMailer.match_message_create(current_user, @user).deliver
        format.html { redirect_to [@match, @warrant], notice: 'Warrant was successfully created.' }
        format.json { render :show, status: :created, location: [@match, @warrant] }
      else
        format.html { render :new }
        format.json { render json: @warrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /warrants/1
  # PATCH/PUT /warrants/1.json
  def update
    respond_to do |format|
      if @warrant.update(warrant_params)
        format.html { redirect_to [@match, @warrant], notice: 'Warrant was successfully updated.' }
        format.json { render :show, status: :ok, location: [@match, @warrant] }
      else
        format.html { render :edit }
        format.json { render json: @warrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warrants/1
  # DELETE /warrants/1.json
  def destroy
    @warrant.destroy
    respond_to do |format|
      format.html { redirect_to match_warrants_url, notice: 'Warrant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_match
    @match = Match.find(params[:match_id])
  end

  def set_warrant
    @warrant = Warrant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def warrant_params
    params.require(:warrant).permit(:status, :price_per_hour, :owner_user_id, :issuer_user_id, :start_datetime, :end_datetime, :price)
  end
end
