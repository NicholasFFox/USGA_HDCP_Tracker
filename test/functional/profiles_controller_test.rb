require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:nick).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render 404 on profile not found" do
    get :show, id: "doesn't exist"
    assert_response :not_found
  end

  test "that variables are assigned on successful profile viewing" do
    get :show, id: users(:nick).profile_name
    assert assigns(:user)
    assert_not_empty assigns(:rounds)
  end

  test "only shows the correct user's rounds" do
    get :show, id: users(:nick).profile_name
    assigns(:rounds).each do |round|
      assert_equal users(:nick), round.user
    end
  end

end
