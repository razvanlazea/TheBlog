class Email < ActionMailer::Base
  include SendGrid
  default from: "razvansblog@gmail.com"

  def recover_email(user)
  	@user = user
  	puts @user.to_yaml
  	mail(to: @user.email, subject: "Sub")
  end
end
