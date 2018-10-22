class InvitationsController < ApplicationController
	before_action :require_user, only: [:create, :new]

	def new
		@invitation = Invitation.new
	end

	def create
		@invitation = current_user.invitations.build(invitation_params)
		if @invitation.sav
			flash[:sucess] = "Invitation sent!"
			redirect_to @invitation
		else
			render :new
		end
	end
	def show
		@invitation = Invitation.find(params[:id])
	end

	private
	def invitation_params
		params.require(:invitation).permit(:event, :invited_user)
	end
end