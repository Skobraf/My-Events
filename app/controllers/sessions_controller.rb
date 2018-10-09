class SessionsController < ApplicationController
	
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user 
			session[:user_id] = user.id
			flash[:success] = 'You are logged in!'
			redirect_to root_path
		else
			flash.now[:danger] = "Email is wrong!"
			redirect_to 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = 'You are now logged out'
		redirect_to root_path
	end
end