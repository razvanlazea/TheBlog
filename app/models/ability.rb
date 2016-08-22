class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new
		if user.role_id == 2
			can :manage, Post
			can :create, Comment

		elsif user.role_id == 1 
			can :manage, Post
			cannot :edit, Post
			can :manage, Comment
			cannot :edit, Comment
			can :destroy, User
		else
			can :read, Post
			can :create, Comment
			can :read, Comment
		end
	end
end