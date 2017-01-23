class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "User created"
			log_in(@user)
			redirect_to @user
		else
			render 'new'
		end	
	end

	def show
		redirect_to root_url unless logged_in?
		@user = User.find_by(id: params[:id])
		@upcoming_events = @user.upcoming_events
		@prev_events = @user.previous_events
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
