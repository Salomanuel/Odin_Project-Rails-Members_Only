class User < ApplicationRecord
		EMAIL_REGEX = /\A^\w+[\w+-]+\.{0,1}[\w]+@\[*\w+[\w.-]+\w+\.\w+\]*$\z/i


	validates_presence_of :name, :email
	validates_length_of 	:name, 	maximum: 20
	validates_length_of 	:email, maximum: 50
	validates_format_of		:email, with: EMAIL_REGEX

	has_secure_password
end
