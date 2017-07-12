require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest



	test "login should work" do
		get login_path
		post login_path, params: { session: {email: "user@example.com",
																				password: "foobar" } }
		assert_select "h1", "logged in"
	end
end