class WelcomeEmailMailer < ApplicationMailer
  default from: "'PerTutor' <support@pertutor.com>"



  def welcome_email(user, account)
    @user = user
    @account = account
    make_bootstrap_mail(
      to: @user.email,
      subject: "Welcome to PerTutor, #{user.username.capitalize}!"
    )
  end
end
