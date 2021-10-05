require "test_helper"

class PeopleTagTest < ActiveSupport::TestCase
  setup do
  end

  test "should have name" do
    people_tag = PeopleTag.new
    people_tag.valid?
    assert_not people_tag.errors[:name].empty?
  end

  test "should have name unique" do
    people_tag = PeopleTag.new(name: "people_tag")
    assert people_tag.save!

    assert_raises ActiveRecord::RecordInvalid do
      people_tag2 = PeopleTag.new(name: "people_tag")
      people_tag2.save!
    end

    people_tag3 = PeopleTag.new(name: "people_tag")
    assert people_tag3.save!

    assert_raises ActiveRecord::RecordInvalid do
      people_tag4 = PeopleTag.new(name: "people_tag")
      people_tag4.save!
    end
  end
end
