require 'test_helper'

class BirdersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:birders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create birder" do
    assert_difference('Birder.count') do
      post :create, :birder => { }
    end

    assert_redirected_to birder_path(assigns(:birder))
  end

  test "should show birder" do
    get :show, :id => birders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => birders(:one).to_param
    assert_response :success
  end

  test "should update birder" do
    put :update, :id => birders(:one).to_param, :birder => { }
    assert_redirected_to birder_path(assigns(:birder))
  end

  test "should destroy birder" do
    assert_difference('Birder.count', -1) do
      delete :destroy, :id => birders(:one).to_param
    end

    assert_redirected_to birders_path
  end
end
