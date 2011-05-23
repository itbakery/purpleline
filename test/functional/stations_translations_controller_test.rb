require 'test_helper'

class StationsTranslationsControllerTest < ActionController::TestCase
  setup do
    @stations_translation = stations_translations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stations_translations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stations_translation" do
    assert_difference('StationsTranslation.count') do
      post :create, :stations_translation => @stations_translation.attributes
    end

    assert_redirected_to stations_translation_path(assigns(:stations_translation))
  end

  test "should show stations_translation" do
    get :show, :id => @stations_translation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @stations_translation.to_param
    assert_response :success
  end

  test "should update stations_translation" do
    put :update, :id => @stations_translation.to_param, :stations_translation => @stations_translation.attributes
    assert_redirected_to stations_translation_path(assigns(:stations_translation))
  end

  test "should destroy stations_translation" do
    assert_difference('StationsTranslation.count', -1) do
      delete :destroy, :id => @stations_translation.to_param
    end

    assert_redirected_to stations_translations_path
  end
end
