class UsersController < ApplicationController

	rescue_from CanCan::AccessDenied do |e|
		redirect_to controller: "posts", action: "accessDenied" 
	end

	def index
		@users = User.all		
		authorize! :read, User
	end
	
	def new
		@user = User.new
	end

	def create
		@users = User.all
		@users.each do |u|
			if u.username == params[:users][:username] || u.email == params[:users][:email]
				flash[:alert] = "Username or email already exists."
				redirect_to new_user_path and return
			end
		end
		if params[:users][:username] == ADMIN
			redirect_to :back
		else
			@user = User.new(user_params)
			@user.role_id = 2
			if @user.save
				redirect_to posts_url
			end
		end
	end

	def destroy
		@user = User.find(params[:id])
		authorize! :destroy, @user
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
			@key = Key.new
			@key.token = SecureRandom.uuid
			@key.used = false
			@key.users_id = @user.id
			@key.save
			Email.recover_email(@user).deliver
			redirect_to users_url
		else
			redirect_to posts_url
		end
	end

	def email

	end

	def edit
		@key = Key.find_by_token(params[:token])
		if @key
			if @key.used == true || Time.now - @key.created_at > 5.minute
				render :partial => 'expired'			
			end
		else
			redirect_to posts_url and return
		end
		@key.used = true
		@key.save
	end

	def update
		@user = User.find(params[:id])
		@user.password = params[:users][:password]
		@user.save
		redirect_to posts_url
	end

	def current_user
    	User.find_by_username(session[:user_id])
  	end

	def user_params
		params.require(:users).permit(:username, :password, :name, :id, :email, :token, :role_id)
	end
end
