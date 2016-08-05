class SessionsController < ApplicationController

	def new

	end

	def create
		if params[:sessions][:username] == ADMIN && params[:sessions][:password] == PASSWORD
			session[:admin] = ADMIN
			redirect_to :back
		else
			user = User.find_by_username(params[:sessions][:username])
			if user && user.password == params[:sessions][:password]
				session[:user_id] = user.username 
				redirect_to :back
			else
				redirect_to :back
			end
		end
	end	

	def destroy
		session[:user_id] = nil
		session[:admin] = nil
		redirect_to :back
	end
end
