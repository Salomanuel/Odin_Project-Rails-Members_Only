require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

	def setup
		@user = User.new(name: "example",
										email: "example@email.com",
										password: "foobar",
										password_confirmation: "foobar")
	end

	test "signup works" do
		assert_difference "User.count", 1 do
			@user.save
		end
	end

end