require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

	test "signup should work" do
		get new_user_path
		assert_select "form"
		assert_select "input", type:"text", name:"user[name]"
		assert_select "input", name:"user[email]"
		assert_select "input", id: 	"user[password]"
		assert_select "label", "Password confirmation"
		assert_select "input", type:"submit"
		assert_difference "User.count", 1 do
			post users_path, params: { user: { name: "example",
																			email: "example@email.com",
																			password: "foobar",
																			password_confirmation: "foobar" } }
		end
	end

	test "invalid signup" do
		assert_no_difference "User.count" do
			post users_path, params: { user: { password: "foo", 
														password_confirmation: "bar " } }
		end
		assert_select "form"
		assert_select "input", type:"text", name:"user[name]"
	end
end