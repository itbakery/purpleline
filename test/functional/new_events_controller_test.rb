require 'test_helper'

class NewEventsControllerTest < ActionController::TestCase
  setup do
    @new_event = new_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:new_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create new_event" do
    assert_difference('NewEvent.count') do
      post :create, :new_event => @new_event.attributes
    end

    assert_redirected_to new_event_path(assigns(:new_event))
  end

  test "should show new_event" do
    get :show, :id => @new_event.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @new_event.to_param
    assert_response :success
  end

  test "should update new_event" do
    put :update, :id => @new_event.to_param, :new_event => @new_event.attributes
    assert_redirected_to new_event_path(assigns(:new_event))
  end

  test "should destroy new_event" do
    assert_difference('NewEvent.count', -1) do
      delete :destroy, :id => @new_event.to_param
    end

    assert_redirected_to new_events_path
  end
end
