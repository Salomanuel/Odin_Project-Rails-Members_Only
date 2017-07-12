require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

	test "login link should be present" do
		get root_url
		assert_select "a[href=?]", login_path
	end

end