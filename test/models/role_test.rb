require "test_helper"

class RoleTest < ActiveSupport::TestCase
  setup do
  end

  test "should have name" do
    role = Role.new
    role.valid?
    assert_not role.errors[:name].empty?
  end

  test "should have name unique" do
    role = Role.new(name: "role")
    assert role.save!

    assert_raises ActiveRecord::RecordInvalid do
      role2 = Role.new(name: "role")
      role2.save!
    end

    role3 = Role.new(name: "role")
    assert role3.save!

    assert_raises ActiveRecord::RecordInvalid do
      role4 = Role.new(name: "role")
      role4.save!
    end
  end
end
