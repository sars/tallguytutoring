class UserConfirm < ApplicationMailer

  def confirm_email(token, email)
    confirm_link = Rails.application.routes.url_helpers.confirm_url(token: token)
    mandrill_mail template: 'confirm_email', to: email,  vars: { CONFIRM_LINK: confirm_link }
  end
end
