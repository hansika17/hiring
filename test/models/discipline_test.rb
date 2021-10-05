require "test_helper"

class DisciplineTest < ActiveSupport::TestCase
  setup do
  end

  test "should have name" do
    discipline = Discipline.new
    discipline.valid?
    assert_not discipline.errors[:name].empty?
  end

  test "should have name unique" do
    discipline = Discipline.new(name: "Discipline")
    assert discipline.save!

    assert_raises ActiveRecord::RecordInvalid do
      discipline2 = Discipline.new(name: "Discipline")
      discipline2.save!
    end

    discipline3 = Discipline.new(name: "Discipline")
    assert discipline3.save!

    assert_raises ActiveRecord::RecordInvalid do
      discipline4 = Discipline.new(name: "Discipline")
      discipline4.save!
    end
  end
end
