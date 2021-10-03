require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
  end

  test "should have email" do
    user = User.new
    user.valid?
    assert_not user.errors[:email].empty?
  end

  test "should have first name" do
    user = User.new
    user.valid?
    assert_not user.errors[:first_name].empty?
  end

  test "should have last name" do
    user = User.new
    user.valid?
    assert_not user.errors[:last_name].empty?
  end
end
