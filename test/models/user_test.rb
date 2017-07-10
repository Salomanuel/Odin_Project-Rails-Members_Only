require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name:"Example User", email: "user@example.com",
										password: "foobar", password_confirmation: "foobar")
	end

	test "it works" do
		assert @user.valid?
	end

	# NAME 
	test "name cannot be blank" do
		@user.name = ""
		assert_not @user.valid?
	end

	test "name cannot be too long" do
		@user.name = "a" * 50
		assert_not @user.valid?
	end

	# EMAIL
	test "email cannot be blank" do
		@user.email = ""
		assert_not @user.valid?
	end

	test "email cannot be too long" do
		@user.email = "a" * 50 + "@example.com"
		assert_not @user.valid?
	end

	test "valid emails are valid" do
		valid = %w(
							email@example.com
							firstname.lastname@example.com
							email@subdomain.example.com
							firstname+lastname@example.com
							email@123.123.123.123
							email@[123.123.123.123]
							1234567890@example.com
							email@example-one.com
							_______@example.com
							email@example.name
							email@example.museum
							email@example.co.jp
							firstname-lastname@example.com)
		valid.each 		do |e| 
			@user.email = e
			assert @user.valid?
		end
	end

	test "NOT valid emails are unvalid" do
		unvalid = %w(								plainaddress
									#@%^%#$@#$@#.com
									@example.com
									email.example.com
									email.@example.com
									あいうえお@example.com
									email@example
									email@-example.com
									email@example..com

									JoeSmith<email@example.com>
									email@example@example.com
									.email@example.com
									email..email@example.com
									email@example.com(JoeSmith)		
									Abc..123@example.com

								)
		unvalid.each do |e| 
			@user.email = e
			puts e
			assert_not @user.valid?
		end
	end

	test "emails should be UNIQUE" do
		duplicate_user = @user.dup
		@user.save
		assert_not duplicate_user.valid?
	end

	# PASSWORD

	test "password cannot be blank" do
		skip
		@user.password = ""
		assert_not @user.valid?
	end

	test "password cannot be too short" do
		skip
		@user.password = "abcde"
		assert_not @user.valid?
	end
end
