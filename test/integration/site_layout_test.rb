require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	test "basic layout" do
		get root_path
		assert_template 'members/home'
		assert_select "h1",	"welcome"
	end
end