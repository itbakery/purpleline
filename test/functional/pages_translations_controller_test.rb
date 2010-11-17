require 'test_helper'

class PagesTranslationsControllerTest < ActionController::TestCase
  setup do
    @pages_translation = pages_translations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pages_translations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pages_translation" do
    assert_difference('PagesTranslation.count') do
      post :create, :pages_translation => @pages_translation.attributes
    end

    assert_redirected_to pages_translation_path(assigns(:pages_translation))
  end

  test "should show pages_translation" do
    get :show, :id => @pages_translation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pages_translation.to_param
    assert_response :success
  end

  test "should update pages_translation" do
    put :update, :id => @pages_translation.to_param, :pages_translation => @pages_translation.attributes
    assert_redirected_to pages_translation_path(assigns(:pages_translation))
  end

  test "should destroy pages_translation" do
    assert_difference('PagesTranslation.count', -1) do
      delete :destroy, :id => @pages_translation.to_param
    end

    assert_redirected_to pages_translations_path
  end
end
