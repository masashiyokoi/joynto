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
    @direct_message = from_user.following_by_type('Channel').direct_message && to_user.following_by_type('Channel').direct_message.first
    @to_user = to_user
    @from_user = from_user
    mail(
      subject: "#{@from_user.name}さんから、メッセージが届いています。",
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
      subject: "#{@from_user.name}さんがタイムズメッセージを投稿しました。",
      to: @to_user.email
    ) do |format|
      format.text
    end
  end

  def new_user_announce(new_user, to_user)
    @new_user = new_user
    @to_user = to_user
    mail(
      subject: "新規ユーザーの方が登録されました。",
      to: @to_user.email
    ) do |format|
      format.text
    end
  end
end
