class NotificationMailer < ApplicationMailer

  def send_confirm_to_user(from_user, to_user)
    @user = to_user
    @from_user = from_user
    mail(
      subject: "タイムラインに、いいねがされました。",
      to: @user.email
    ) do |format|
      format.text
    end
  end

  def send_follow_message_to_user(from_user, to_user)
    @to_user = to_user
    @from_user = from_user
    mail(
      subject: "#{@from_user.name}さんから、フォローされました。",
      to: @to_user.email
    ) do |format|
      format.text
    end
  end

  def direct_message_to_user(from_user, to_user)
    @direct_message = from_user.following_by_type('Channel::DirectMessage') && to_user.following_by_type('Channel::DirectMessage').first
    @to_user = to_user
    @from_user = from_user
    mail(
      subject: "[direct message][#{@from_user.name}]",
      to: @to_user.email
    ) do |format|
      format.text
    end
  end

  def direct_message_create(from_user, to_user)
    @to_user = to_user
    @from_user = from_user
    mail(
      subject: "#{@from_user.name}さんとのダイレクトメッセージが可能になりました。",
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
