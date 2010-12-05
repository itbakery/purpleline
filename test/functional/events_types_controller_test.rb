require 'test_helper'

class EventsTypesControllerTest < ActionController::TestCase
  setup do
    @events_type = events_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create events_type" do
    assert_difference('EventsType.count') do
      post :create, :events_type => @events_type.attributes
    end

    assert_redirected_to events_type_path(assigns(:events_type))
  end

  test "should show events_type" do
    get :show, :id => @events_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @events_type.to_param
    assert_response :success
  end

  test "should update events_type" do
    put :update, :id => @events_type.to_param, :events_type => @events_type.attributes
    assert_redirected_to events_type_path(assigns(:events_type))
  end

  test "should destroy events_type" do
    assert_difference('EventsType.count', -1) do
      delete :destroy, :id => @events_type.to_param
    end

    assert_redirected_to events_types_path
  end
end
