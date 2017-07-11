require 'test_helper'

class HelloTest < ActionDispatch::IntegrationTest

	test "the home should say hello" do
		get root_path
		assert_select "h1", "hello world!"
	end
end