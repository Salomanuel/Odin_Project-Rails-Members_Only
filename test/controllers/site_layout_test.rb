require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

	test "login link should be present at root" do
		get root_url
		assert_select "a[href=?]", login_path
	end

	test "form check at /login" do
		get login_path
		assert_select "form"
		assert_select "input"#, count: 3
		assert_select "input", "login"
	end

end