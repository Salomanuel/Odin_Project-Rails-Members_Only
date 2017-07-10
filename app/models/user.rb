class User < ApplicationRecord
	EMAIL_REGEX = /\A^\w+[\w+-]+\.{0,1}[\w]+@\[*\w+[\w.-]+\w+\.\w+\]*$\z/i


	validates 						:name, 	presence: true, length: { maximum: 20 }
	validates							:email,	presence: true, length: { maximum: 50 },
																format: { with: EMAIL_REGEX },
																uniqueness:

	has_secure_password
end
