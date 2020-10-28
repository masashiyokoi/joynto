class NotificationMailer < ApplicationMailer

  def send_confirm_to_user(from_user, to_user)
    @user = to_user
    @from_user = from_user
    mail(
      subject: "New vote to your times",
      to: @user.email
    ) do |format|
      format.text
    end
  end

  def send_request_message_to_user(from_user, to_user)
    @to_user = to_user
    @from_user = from_user
    mail(
      subject: "New match request",
      to: @to_user.email
    ) do |format|
      format.text
    end
  end

  def match_message_to_user(from_user, to_user, match)
    @match = match
    @to_user = to_user
    @from_user = from_user
    mail(
      subject: "[direct message][#{@from_user.name}]",
      to: @to_user.email
    ) do |format|
      format.text
    end
  end

  def match_message_create(from_user, to_user)
    @to_user = to_user
    @from_user = from_user
    mail(
      subject: "New match connected",
      to: @to_user.email
    ) do |format|
      format.text
    end
  end

  def times_message_create(from_user, to_user, message_id)
    @to_user = to_user
    @from_user = from_user
    @message_id = message_id
    mail(
      subject: "[times message][#{@from_user.name}]",
      to: @to_user.email
    ) do |format|
      format.text
    end
  end

  def new_user_announce(new_user, to_user)
    @new_user = new_user
    @to_user = to_user
    mail(
      subject: "[new user]",
      to: @to_user.email
    ) do |format|
      format.text
    end
  end
end
