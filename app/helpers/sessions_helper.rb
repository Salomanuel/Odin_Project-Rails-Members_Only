module SessionsHelper
	def log_in(user)			# writing to the SESSIONS cookie
		session[:user_id] = user.id
	end

	def current_user
		if 		(user_id = session[:user_id])
			@current_user ||= User.find_by(id: user_id)
		elsif (user_id = cookies.signed[:user_id])
			# raise
			user = User.find_by(id: user_id)
			if user && user.authenticated?(cookies[:remember_token])
				log_in user
				@current_user = user
			end
		end
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

	def forget(user)
		user.forget # from User model
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end

	def log_out
		forget(current_user)
		session.delete(:user_id)
		@current_user = nil
	end
end