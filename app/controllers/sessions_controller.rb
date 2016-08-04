class SessionsController < ApplicationController

	def new

	end

	def create
		puts params.to_yaml
		user = User.find_by_username(params[:sessions][:username])
		if user && user.password == params[:sessions][:password]
			session[:user_id] = user.id 
			redirect_to posts_url
		else
			redirect_to posts_url
		end
	end	

	def destroy
		session[:user_id] = nil
		redirect_to posts_url
	end
end
