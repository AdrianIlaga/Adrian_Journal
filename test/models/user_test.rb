require "test_helper"

class UserTest < ActiveSupport::TestCase

  setup do
    @user = users(:one)
  end

  test "user must have username" do
    new_user = User.new
    # new_user.username = "Bla"
    new_user.email = "test@yahoo.com"
    new_user.password = "password"
    assert_not new_user.save, "Saved without username"
  end

  test "username must be unique" do
    new_user = User.new
    new_user.username = "Bla"
    new_user.email = "test@yahoo.com"
    new_user.password = "password"
    new_user.save

    new_user = User.new
    new_user.username = "Bla"
    new_user.email = "test2@yahoo.com"
    new_user.password = "password"
    assert_not new_user.save, "Saved with duplicate username"
  end

  test "user must have email" do
    new_user = User.new
    new_user.username = "Bla"
    # new_user.email = "test@yahoo.com"
    new_user.password = "password"
    assert_not new_user.save, "Saved without email"
  end

  test "email must be unique" do
    new_user = User.new
    new_user.username = "Bla"
    new_user.email = "test@yahoo.com"
    new_user.password = "password"
    new_user.save

    new_user = User.new
    new_user.username = "Bla2"
    new_user.email = "test@yahoo.com"
    new_user.password = "password"
    assert_not new_user.save, "Saved with duplicate email"
  end

  test "user must have password" do 
    new_user = User.new
    new_user.username = "Bla"
    new_user.email = "test@yahoo.com"
    # new_user.password = "password"
    assert_not new_user.save, "Saved without password"
  end


end
