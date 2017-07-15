module SessionsHelper
	def log_in(user)			# writing to the SESSIONS cookie
		session[:user_id] = user.id
	end

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
		!current_user.nil?
	end

	# writes two cookies: cookies[:user_id] and cookies[:remember_token]
	def remember(user)
		user.remember # from the User model
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:remember_token] = user.remember_token
	end
end