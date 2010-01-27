require 'test_helper'

class FollowRequestsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:follow_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create follow_request" do
    assert_difference('FollowRequest.count') do
      post :create, :follow_request => { }
    end

    assert_redirected_to follow_request_path(assigns(:follow_request))
  end

  test "should show follow_request" do
    get :show, :id => follow_requests(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => follow_requests(:one).to_param
    assert_response :success
  end

  test "should update follow_request" do
    put :update, :id => follow_requests(:one).to_param, :follow_request => { }
    assert_redirected_to follow_request_path(assigns(:follow_request))
  end

  test "should destroy follow_request" do
    assert_difference('FollowRequest.count', -1) do
      delete :destroy, :id => follow_requests(:one).to_param
    end

    assert_redirected_to follow_requests_path
  end
end
