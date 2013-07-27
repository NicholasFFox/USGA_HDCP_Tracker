require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "must have name" do
    course = Course.new
    assert !course.save
    assert !course.errors[:name].empty?
  end

  test "must have tee" do
    course = Course.new
    assert !course.save
    assert !course.errors[:tee].empty?
  end

  test "must have slope" do
    course = Course.new
    assert !course.save
    assert !course.errors[:slope].empty?
  end

  test "must have rating" do
    course = Course.new
    assert !course.save
    assert !course.errors[:rating].empty?
  end

  test "must have unique tee for course" do
    course = Course.new

    course.name = courses(:patuxent).name
    course.tee = courses(:patuxent).tee

    assert !course.save
    assert !course.errors[:tee].include?("This tee exists")

  end

end
