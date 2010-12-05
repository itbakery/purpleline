require 'test_helper'

class EventsTranslationsControllerTest < ActionController::TestCase
  setup do
    @events_translation = events_translations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events_translations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create events_translation" do
    assert_difference('EventsTranslation.count') do
      post :create, :events_translation => @events_translation.attributes
    end

    assert_redirected_to events_translation_path(assigns(:events_translation))
  end

  test "should show events_translation" do
    get :show, :id => @events_translation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @events_translation.to_param
    assert_response :success
  end

  test "should update events_translation" do
    put :update, :id => @events_translation.to_param, :events_translation => @events_translation.attributes
    assert_redirected_to events_translation_path(assigns(:events_translation))
  end

  test "should destroy events_translation" do
    assert_difference('EventsTranslation.count', -1) do
      delete :destroy, :id => @events_translation.to_param
    end

    assert_redirected_to events_translations_path
  end
end
