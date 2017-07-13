require 'test_helper'


class UsersLoginTest < ActionDispatch::IntegrationTest

	def setup # FIXTURE
		@user = users(:michael)
	end

	test "it should login" do

		get login_path
		assert_select "input", name: "user[email]"
		assert_select "input", name: "user[password]"
		post login_path, params: { session: { email: @user.email, password: @user.password } }
		assert_select "a[href=?]", login_path, 	count: 0
		assert_select "a[href=?]", logout_path, count: 1
	end



end