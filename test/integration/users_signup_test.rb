require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

	test "signup should work" do
		get new_user_path
		assert_select "form"
		assert_select "input", "name"
		assert_select "input", "email"
		assert_select "input", "password"
		assert_select "input", "password confirmation"
		# post users_path

	end

end