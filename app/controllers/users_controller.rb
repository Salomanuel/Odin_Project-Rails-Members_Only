class UsersController < ApplicationController

	def show
		@user = User.find_by(id:params[:id]) 
	end

	def new
		@user = User.new
	end

	def index
		@users = User.all
		# debugger
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "user saved!"
			redirect_to @user
		else
			# failure
			flash.now[:danger]  = "user NOT saved"
			render 'new'
		end
	end

	private
		def user_params
			params.require(:user).permit(:name, 
																	 :email, 
																	 :password, 
																	 :password_confirmation)
		end
end