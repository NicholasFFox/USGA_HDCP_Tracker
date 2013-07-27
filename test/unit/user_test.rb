require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "entered first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test "entered last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "entered profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "unique profile name" do
    user = User.new
    user.profile_name = users(:nick).profile_name    
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "no spaces in profile_name" do
    user = User.new
    user.profile_name = "profile name with spaces"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

end
