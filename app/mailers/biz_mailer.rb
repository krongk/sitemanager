class BizMailer < ActionMailer::Base
  layout 'email'
  default from: "77632132@qq.com"

  #Overwrite config.action_mailer.smtp_settings
  self.smtp_settings = {
    address: "smtp.qq.com",
    port: 25,
    domain: "65960.com",
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: '77632132',
    password: 'i3e5kenrome!'
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
    mail to: "77632132@qzone.qq.com"
  end
end
