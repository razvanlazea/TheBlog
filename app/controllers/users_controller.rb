class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@users = User.all
		@users.each do |u|
			if u.username == params[:users][:username]
				# flash[:notice] = "da"
				redirect_to new_user_path ,flash: {error: "Errrror!"} and return
			end
		end
		@user = User.new(user_params)
		if @user.save
			redirect_to posts_url
		end
	end


	def user_params
		params.require(:users).permit(:username, :password, :name)
	end
end
