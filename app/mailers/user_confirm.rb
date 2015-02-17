class UserConfirm < ApplicationMailer
  include SendGrid

  def confirm_email(token, email)
    @token = token
    sendgrid_category :welcome
    mail to: email, subject: 'Welcome!'
  end
end
