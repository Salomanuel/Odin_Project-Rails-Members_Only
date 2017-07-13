class User < ApplicationRecord
	has_secure_password


	# necessary for the fixtures
	def User.digest(string) # please refactor
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost 
		BCrypt::Password.create(string, cost: cost)
	end
end
