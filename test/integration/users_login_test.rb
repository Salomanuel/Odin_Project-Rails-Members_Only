require 'test_helper'


class UsersLoginTest < ActionDispatch::IntegrationTest

	def setup # FIXTURE
		@user = users(:michael)
	end

	test "it should login" do
		get login_path
		assert_select "input", name: "user[email]"
		assert_select "input", name: "user[password]"
		post login_path, params: { session: { email: @user.email, password: "password" } }
		assert_redirected_to @user
		follow_redirect!
		assert_select "a[href=?]", login_path, 	count: 0
		assert_select "a[href=?]", logout_path, count: 1
	end

	test "remember_test" do
		log_in_as(@user, remember_me: "1")
		assert_not_empty cookies['remember_token']
	end

	test "don't remember test" do
		log_in_as(@user, remember_me: "1")
		# log in again to verify that the cookie is GONE
		log_in_as(@user, remember_me: "0")
		assert_empty cookies['remember_token']
	end

	test "it should NOT login" do
		post login_path, params: { session: { email: @user.email, password: "foobaz" } }
		assert_select "form"
		assert_select "input", name: "user[email]"
	end
end