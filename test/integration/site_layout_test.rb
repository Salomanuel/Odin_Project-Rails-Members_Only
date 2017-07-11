require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	test "basic layout" do
		get root_path
		assert_select "h1",	"welcome"
	end

	test "home page" do
		# if not signed in
		get root_path
		assert_select "form"
		assert_select "input"
		# if signed in
		# post login_path, params: { session: }

	end
end