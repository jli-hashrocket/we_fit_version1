class UserConfirmation < ActionMailer::Base
  default from: "no_reply@wefit.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_confirmation.member_info.subject
  #
  def member_info(user)
    @greeting = "Hi"

    mail(to: user.email,
      subject: 'Member Confirmation')
  end
end
