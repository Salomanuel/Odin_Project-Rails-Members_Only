class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			log_in user		# from sessions_helper
			redirect_to user
		else
			render 'new'
		end
	end

	def destroy
	end

end