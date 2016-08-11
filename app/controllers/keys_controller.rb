class KeysController < ApplicationController
	
	def index
		@keys = Key.all
		@users = User.all
	end

	def create
		@key = Key.new
	end

	def edit
		
	end

end
