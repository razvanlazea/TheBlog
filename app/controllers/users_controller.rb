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
			if u.username == params[:users][:username] || u.email == params[:users][:email]
				flash[:notice] = "Username or email already exists."
				redirect_to new_user_path and return
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

	def find
		@user = User.find_by_email(params[:users][:email])
		if @user 
			# @key = Key.new
			# @key.token = SecureRandom.uuid
			# @key.used = false
			# @key.users_id = @user.id
			# @key.save
			Email.recover_email(@user).deliver
			redirect_to users_url
		else
			redirect_to posts_url
		end
	end

	def email

	end

	def generate_token(column, length = 64)
		begin
			self[column] = SecureRandom.urlsafe_base64 length
		end while Key.exists?(column => self[column])
	end

	def user_params
		params.require(:users).permit(:username, :password, :name, :id, :email)
	end
end