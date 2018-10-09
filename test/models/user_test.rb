require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:valid)
  end

  test "valid user" do 
  	assert @user.valid?
  end

  test "invalid without name" do 
  	@user.name = nil
  	assert_not @user.valid?
  end

  test "invalid without email" do
  	@user.email = " "
  	assert_not @user.valid?
  end

  test "name should not be too long" do
  	@user.name = "a" * 51
  	assert_not @user.valid?
  end

  test "email should not be too long" do
  	@user.email = "a" * 244 + "@example.com"
  	assert_not @user.valid?
  end

  test "email should be unique" do 
  	duplicate_user = @user.dup
  	@user.save
  	assert_not duplicate_user.valid?
  end
end
