require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: 		"Manuel",
										email: 		"manuel@example.com",
										password: "foobar",
										password_confirmation: "foobar")
	end

	test "it should be valid" do
		assert @user.valid?
	end

	test "authenticate should work" do 
		assert_equal @user.authenticate(@user.password), @user
	end

	test "validations" do
	end

end