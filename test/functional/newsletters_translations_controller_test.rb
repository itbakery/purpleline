require 'test_helper'

class NewslettersTranslationsControllerTest < ActionController::TestCase
  setup do
    @newsletters_translation = newsletters_translations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:newsletters_translations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create newsletters_translation" do
    assert_difference('NewslettersTranslation.count') do
      post :create, :newsletters_translation => @newsletters_translation.attributes
    end

    assert_redirected_to newsletters_translation_path(assigns(:newsletters_translation))
  end

  test "should show newsletters_translation" do
    get :show, :id => @newsletters_translation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @newsletters_translation.to_param
    assert_response :success
  end

  test "should update newsletters_translation" do
    put :update, :id => @newsletters_translation.to_param, :newsletters_translation => @newsletters_translation.attributes
    assert_redirected_to newsletters_translation_path(assigns(:newsletters_translation))
  end

  test "should destroy newsletters_translation" do
    assert_difference('NewslettersTranslation.count', -1) do
      delete :destroy, :id => @newsletters_translation.to_param
    end

    assert_redirected_to newsletters_translations_path
  end
end
