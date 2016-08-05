class UsersController < ApplicationController

	def index
		@users = User.all
	end
	
	def new
		@user = User.new
	end

	def create
		@users = User.all
		@users.each do |u|
			if u.username == params[:users][:username]
				redirect_to new_user_path ,flash: {error: "Errrror!"} and return
			end
		end
		if params[:users][:username] == ADMIN
			redirect_to new_user_path
		else
			@user = User.new(user_params)
			if @user.save
				redirect_to posts_url
			end
		end
	end

	def destroy
		@user = User.find(params[:id])
		# delete all posts from @user
		@posts = Post.all
		@posts.each do |post|
			if post.name == @user.username
				post.destroy
			end
		end
		# delete user
		@user.destroy
		redirect_to :back
	end

	def user_params
		params.require(:users).permit(:username, :password, :name, :id)
	end
end
