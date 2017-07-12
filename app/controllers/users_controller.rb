class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(strong_params)
		if @user.save
			# success
		else
			render :new
		end
	end

	private
		def strong_params
			params.require(:user).permit(:name, :email,
									:password, :password_confirmation)
		end
end