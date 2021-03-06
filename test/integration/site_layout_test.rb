require 'test_helper'
include SessionsHelper


class SiteLayoutTest < ActionDispatch::IntegrationTest

	test "login link should be present" do
		# skip
		get root_url
		assert_select "a[href=?]", signup_path
		if not logged_in?
			assert_select "a[href=?]", login_path
		else
			assert_select "a[href=?]", logout_path
		end
	end

end