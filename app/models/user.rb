class User < ApplicationRecord
	attr_accessor :remember_token
	has_secure_password
	has_many :posts


	# necessary for the fixtures
	def User.digest(string) # please refactor
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost 
		BCrypt::Password.create(string, cost: cost)
	end

	# generates new random tokens
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	# saves the token to :remember_token (so, temporarily)
	# AND saves remember_digest to the database
	def remember
		self.remember_token = User.new_token # thanks to attr_accessor
		update_attribute(:remember_digest, User.digest(remember_token))
	end								# remember_digest is in the database

	def authenticated?(remember_token)
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	def forget
		update_attribute(:remember_digest, nil)
	end

end
