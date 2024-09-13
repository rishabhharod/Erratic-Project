# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/login_notification
  def login_notification
    UserMailer.login_notification
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/destroy_notification
  def destroy_notification
    UserMailer.destroy_notification
  end

end
