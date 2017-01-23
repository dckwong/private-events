class InvitationsController < ApplicationController
	def create
		@event = Event.find(params[:invitation][:event_id])
		@invitation = current_user.invitations.build(event_id: @event.id)
		if @invitation.save
			flash[:success] = "Attending event!"
			redirect_to @invitation.event
		else
			flash[:danger] = "Something went wrong"
			redirect_to @invitation.event
		end
	end

	def destroy
		@invitation = Invitation.find_by(id: params[:id])
		current_user.invitations.destroy(@invitation)
		flash[:success] = "Cancelled Attendance"
		redirect_to @invitation.event
	end
end
