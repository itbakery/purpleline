require 'test_helper'

class NewEventsTranslationsControllerTest < ActionController::TestCase
  setup do
    @new_events_translation = new_events_translations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:new_events_translations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create new_events_translation" do
    assert_difference('NewEventsTranslation.count') do
      post :create, :new_events_translation => @new_events_translation.attributes
    end

    assert_redirected_to new_events_translation_path(assigns(:new_events_translation))
  end

  test "should show new_events_translation" do
    get :show, :id => @new_events_translation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @new_events_translation.to_param
    assert_response :success
  end

  test "should update new_events_translation" do
    put :update, :id => @new_events_translation.to_param, :new_events_translation => @new_events_translation.attributes
    assert_redirected_to new_events_translation_path(assigns(:new_events_translation))
  end

  test "should destroy new_events_translation" do
    assert_difference('NewEventsTranslation.count', -1) do
      delete :destroy, :id => @new_events_translation.to_param
    end

    assert_redirected_to new_events_translations_path
  end
end
