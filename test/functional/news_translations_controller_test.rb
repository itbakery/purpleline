require 'test_helper'

class NewsTranslationsControllerTest < ActionController::TestCase
  setup do
    @news_translation = news_translations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:news_translations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create news_translation" do
    assert_difference('NewsTranslation.count') do
      post :create, :news_translation => @news_translation.attributes
    end

    assert_redirected_to news_translation_path(assigns(:news_translation))
  end

  test "should show news_translation" do
    get :show, :id => @news_translation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @news_translation.to_param
    assert_response :success
  end

  test "should update news_translation" do
    put :update, :id => @news_translation.to_param, :news_translation => @news_translation.attributes
    assert_redirected_to news_translation_path(assigns(:news_translation))
  end

  test "should destroy news_translation" do
    assert_difference('NewsTranslation.count', -1) do
      delete :destroy, :id => @news_translation.to_param
    end

    assert_redirected_to news_translations_path
  end
end
