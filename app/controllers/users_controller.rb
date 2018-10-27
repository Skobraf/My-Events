class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "Welcome to our App"
			redirect_to "root_path"

		else
			redirect_to 'new'
		end
	end

	def home
		
	end

	def pending_invitations
		@invitations = current_user.invitations_received.all
	end

	private
	def user_params
		params.require(:user).permit(:name, :email)
	end
end


	