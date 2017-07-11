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
				assert @user.valid?, "#{e} should be valid"
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
				assert_not @user.valid?, "#{e} should not be valid"
			end
		end

		test "emails should be UNIQUE" do
			duplicate_user = @user.dup
			@user.save
			assert_not duplicate_user.valid?
		end

		test "emails should be saved LOWER_CASE" do
			camel_email  = "UseR@eXampLe.com" 
			@user.email = camel_email
			@user.save
			assert_equal camel_email.downcase, @user.reload.email 
		end

	# PASSWORD

		test "password cannot be blank" do
			@user.password = " "
			assert_not @user.valid?
		end

		test "password cannot be too short" do
			@user.password = "abcde"
			assert_not @user.valid?
		end

		test "password_confirmation works" do
			@user.password_confirmation = "banana"
			assert_not @user.valid?
		end

	# SIGN UP
		test "valid signup" do
			assert_difference 'User.count', 1 do
			 @user.save 
			end			
		end

	# SIGN IN
		test "authentication should not work with wrong credentials" do
			assert_not @user.authenticate("")
		end

		test "user can login" do
			assert @user.authenticate(@user.password)
		end
end
