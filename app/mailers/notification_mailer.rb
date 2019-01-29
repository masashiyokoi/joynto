class NotificationMailer < ApplicationMailer

  def send_confirm_to_user(user, from_user)
    @user = user
    @from_user = from_user
    mail(
      subject: "タイムラインに、いいねがされました。",
      to: @user.email
    ) do |format|
      format.text
    end
  end

  def send_follow_message_to_user(to_user, from_user)
    @to_user = to_user
    @from_user = from_user
    mail(
      subject: "#{@from_user.name}さんから、フォローされました。",
      to: @to_user.email
    ) do |format|
      format.text
    end
  end
end
