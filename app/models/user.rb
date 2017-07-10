class User < ApplicationRecord
	before_save { self.email = email.downcase }
	EMAIL_REGEX = /\A^\w+[\w+-]+\.{0,1}[\w]+@\[*\w+[\w.-]+\w+\.\w+\]*$\z/i


	validates 	:name, 			presence: 	true, 
													length: 		{ maximum: 20 }
	validates		:email,			presence: 	true, 
													length: 		{ maximum: 50 },
													format: 		{ with: EMAIL_REGEX },
													uniqueness: {case_sensitive: false }

	validates		:password, 	presence: 	true, 
													length: 		{ minimum: 6 }
	has_secure_password
end
