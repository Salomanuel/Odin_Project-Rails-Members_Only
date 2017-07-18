class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(strong_params)
		if @user.save
			redirect_to root_path
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
	end

	private
		def strong_params
			params.require(:user).permit(:name, :email,
									:password, :password_confirmation)
		end
end