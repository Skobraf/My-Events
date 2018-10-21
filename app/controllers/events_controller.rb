class EvenetsController < ApplicationController
		before_action :require_user, only: [:create, :new]
	def index
		@past_events = Event.past
		@future_events = Event.future
	end

	def new
		@event = Event.new
	end

	def create
		@event = current_user.build(event_params)
		if @event.save
			redirect_to @event
		else
			render :new
		end
	end

	def show 
		@event = Event.find(params[:id])
	end

	private

	def event_params
		params.require(:event).permit(:name, :description, :date)
	end
end