class UsersController < ApplicationController
	before_action :logged_in_user
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
		@user  = User.find(params[:id])
		@posts = @user.posts
	end

	private
		def strong_params
			params.require(:user).permit(:name, :email,
									:password, :password_confirmation)
		end
end