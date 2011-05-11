require 'test_helper'

class ReportsTranslationsControllerTest < ActionController::TestCase
  setup do
    @reports_translation = reports_translations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reports_translations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reports_translation" do
    assert_difference('ReportsTranslation.count') do
      post :create, :reports_translation => @reports_translation.attributes
    end

    assert_redirected_to reports_translation_path(assigns(:reports_translation))
  end

  test "should show reports_translation" do
    get :show, :id => @reports_translation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @reports_translation.to_param
    assert_response :success
  end

  test "should update reports_translation" do
    put :update, :id => @reports_translation.to_param, :reports_translation => @reports_translation.attributes
    assert_redirected_to reports_translation_path(assigns(:reports_translation))
  end

  test "should destroy reports_translation" do
    assert_difference('ReportsTranslation.count', -1) do
      delete :destroy, :id => @reports_translation.to_param
    end

    assert_redirected_to reports_translations_path
  end
end
