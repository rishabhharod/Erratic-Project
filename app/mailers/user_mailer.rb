class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.login_notification.subject
  #
  def login_notification
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.destroy_notification.subject
  #
  def destroy_notification
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
