require "test_helper"

class SkillTest < ActiveSupport::TestCase
  setup do
  end
  test "should have name" do
    skill = Skill.new
    skill.save
    assert_not skill.errors[:name].empty?
  end

  test "should have name unique to tenant" do
    skill = Skill.new(name: "skill")
    assert skill.save!

    assert_raises ActiveRecord::RecordInvalid do
      skill2 = Skill.new(name: "skill")
      skill2.save!
    end

    ActsAsTenant.current_tenant = accounts(:infosys)

    skill3 = Skill.new(name: "skill")
    assert skill3.save!

    assert_raises ActiveRecord::RecordInvalid do
      skill4 = Skill.new(name: "skill")
      skill4.save!
    end
  end
end
