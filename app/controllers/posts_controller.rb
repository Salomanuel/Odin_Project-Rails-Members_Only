include ApplicationHelper
class PostsController < ApplicationController
	before_action :logged_in_user

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

end