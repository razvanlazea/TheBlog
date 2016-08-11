class Email < ActionMailer::Base
  include SendGrid
  default from: "razvansblog@gmail.com"
  
  def recover_email(user)
  	@user = user
  	
  	@token = ''
  	@keys = Key.all
  	@keys.each do |k|
  		if k.users_id == @user.id && k.used == false
  			@token = k.token
  		end
  	end
  	
  	@host = ''
 	if Rails.env == 'development'
      @host = 'http://localhost:3000'
  	else 
      @host = 'razvansblog.heroku.com'
  	end
  	
  	mail(to: @user.email, subject: "Sub")
  end
end
