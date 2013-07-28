require 'test_helper'

class RoundsControllerTest < ActionController::TestCase
  setup do
    @round = rounds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rounds)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render the new page when logged in" do
    sign_in users(:nick)
    get :new
    assert_response :success
  end

  test "should be logged in to post a status"  do
    post :create, round: {course_id: 1, score: 72}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end



  test "should create round when logged in" do
    sign_in users(:nick)
    assert_difference('Round.count') do
      post :create, round: { course_id: @round.course_id, score: @round.score, user_id: @round.user_id }
    end

    assert_redirected_to round_path(assigns(:round))
  end

  test "should show round" do
    get :show, id: @round
    assert_response :success
  end

  test "should get edit when logged in" do
    sign_in users(:nick)
    get :edit, id: @round
    assert_response :success
  end

  test "should redirect round update when logged in" do
    put :update, id: @round, round: { course_id: @round.course_id, score: @round.score, user_id: @round.user_id }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update round when logged in" do
    sign_in users(:nick)
    put :update, id: @round, round: { course_id: @round.course_id, score: @round.score, user_id: @round.user_id }
    assert_redirected_to round_path(assigns(:round))
  end

  test "should destroy round when logged in" do
    sign_in users(:nick)
    assert_difference('Round.count', -1) do
      delete :destroy, id: @round
    end

    assert_redirected_to rounds_path
  end
end
