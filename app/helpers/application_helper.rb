module ApplicationHelper
	def logged_in_user # used in before filters
		unless logged_in?
			redirect_to login_url
		end
	end

	def logged_in? # called by logged_in_user
		!current_user.nil?
	end
end
