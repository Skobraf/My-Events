class InvitationsController < ApplicationController
	before_action :require_user, only: [:new, :create]

	def new
		@invitation = Invitation.new
	end

	def create
		event = Event.find(params[:invitation][:event])
	    user =  User.find_by(name: params[:invitation][:invited_user])

	    @invitation = Invitation.new
	    
	    if user && user.events_as_attendee.find_by(id: event.id) == nil &&
	               user.invitations_received.find_by(event: event) == nil
	      @invitation = current_user.invitations.new(event: event, 
	                                                 invited_user: user)
	    elsif user
	      flash.now[:notice] = "User already invited"
	    else
	      flash.now[:notice] = "User doesn't exist"
	    end

	    if @invitation.save
	      flash[:notice] = "Invitation sent"
	      redirect_to new_invitation_path
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