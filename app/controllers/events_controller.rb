class EventsController < ApplicationController
	def new
		@event = current_user.events.build
	end

	def create
		@event = current_user.events.build(events_param)
		if @event.save
			flash[:success] = "Event created!"
			redirect_to @event
		else
			render 'new'
		end
	end

	def show
		@event = Event.find_by(id: params[:id])
	end

	def index
		@events = Event.all
	end

	private
		def events_param
			params.require(:event).permit(:name, :date, :description)
		end
end
