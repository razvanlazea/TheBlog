class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by_username(params[:sessions][:username])
		if user && user.password == params[:sessions][:password]
			session[:user_id] = user.username 
			redirect_to posts_url
		else
			flash[:notice] = "Wrong username and/or password."
			redirect_to new_session_path
		end
	end	

	def destroy
		session[:user_id] = nil
		session[:admin] = nil
		redirect_to posts_url
	end
end
