require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "must have user" do
    round = Round.new
    assert !round.save
    assert !round.errors[:user_id].empty?
  end

  test "must have course" do
    round = Round.new
    assert !round.save
    assert !round.errors[:course_id].empty?
  end

  test "must have score" do
    round = Round.new
    assert !round.save
    assert !round.errors[:score].empty?
  end

  test "score must be > 18" do
    round = Round.new
    round.score=16
    assert !round.save
    assert !round.errors[:score].empty?
  end

end
