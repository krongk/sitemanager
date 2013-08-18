class BizMailer < ActionMailer::Base
  layout 'email'
  default from: "from@65960.com"

  #Overwrite config.action_mailer.smtp_settings
  self.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "65960.com",
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: ENV["GMAIL_USERNAME_TWO"],
    password: ENV["GMAIL_PASSWORD_TWO"]
  }
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.biz_mailer.marketing_mail.subject
  #
  def marketing_mail(content)
    @greeting = "Hi"
    @content = content
    puts "***************************************send"
    mail to: "master@inruby.com"
  end
end
