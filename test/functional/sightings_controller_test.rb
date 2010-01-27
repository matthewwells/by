require 'test_helper'

class SightingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sightings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sighting" do
    assert_difference('Sighting.count') do
      post :create, :sighting => { }
    end

    assert_redirected_to sighting_path(assigns(:sighting))
  end

  test "should show sighting" do
    get :show, :id => sightings(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sightings(:one).to_param
    assert_response :success
  end

  test "should update sighting" do
    put :update, :id => sightings(:one).to_param, :sighting => { }
    assert_redirected_to sighting_path(assigns(:sighting))
  end

  test "should destroy sighting" do
    assert_difference('Sighting.count', -1) do
      delete :destroy, :id => sightings(:one).to_param
    end

    assert_redirected_to sightings_path
  end
end
