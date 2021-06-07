require "test_helper"

class UserTest < ActiveSupport::TestCase

  setup do
    @user = users(:one)
  end

  test "user must have username" do
    user = User.new
    # user.username = @user.username
    user.email = @user.email
    user.encrypted_password = @user.encrypted_password
    assert_not user.save, "Saved without username"
  end

  test "user must have email" do
    user = User.new
    user.username = @user.username
    # user.email = @user.email
    user.encrypted_password = @user.encrypted_password
    assert_not user.save, "Saved without email"
  end

  test "user must have password" do 
    user = User.new
    user.username = @user.username
    user.email = @user.email
    # user.encrypted_password = @user.encrypted_password
    assert_not user.save, "Saved without password"
  end


end
