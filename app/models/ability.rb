class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new
		if user.role_id == 2
			can :manage, Post
			can :create, Comment
			cannot :manage, User
		elsif user.role_id == 1 
			can :manage, Post
			cannot :edit, Post
			can :manage, Comment
			cannot :edit, Comment
			can :destroy, User
			can :manage, User
		else
			can :create, Post
			can :read, Post
			can :create, Comment
			can :read, Comment
			cannot :manage, User
		end
	end
end