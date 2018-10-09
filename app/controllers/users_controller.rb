class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			
		else
			redirect_to 'new'
		end
	end
end


	