class ContactMailer < ApplicationMailer
  # def send_when_admin_reply(user, contact) #メソッドに対して引数を設定
  #   @user = user #ユーザー情報
  #   @answer = contact.reply_text #返信内容
  #   mail to: user.email, subject: '【カテキョ】 リクエストが届きました'
  # end
 
  # default from: 'notifications@example.com'

  # def welcome_email
  #   @user = params[:user]
  #   @url  = 'http://example.com/login'
  #   mail(to: @user.email, subject: '私の素敵なサイトへようこそ')
  # end
  
  # default from: "hogehoge@example.com"

  # def send_confirm_to_user(user)
  #   @user = user
  #   mail(
  #     subject: "会員登録が完了しました。", #メールのタイトル
  #     to: @user.email #宛先
  #   ) do |format|
  #     format.text
  #   end
  # end
  # def send_mail(user)
  #   @user = user
  #   mail(
  #     from: 'system@example.com',
  #     to:   'manager@example.com',
  #     subject: 'お問い合わせ通知'
  #   )
  # end
end
