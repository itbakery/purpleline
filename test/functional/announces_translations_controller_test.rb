require 'test_helper'

class AnnouncesTranslationsControllerTest < ActionController::TestCase
  setup do
    @announces_translation = announces_translations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:announces_translations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create announces_translation" do
    assert_difference('AnnouncesTranslation.count') do
      post :create, :announces_translation => @announces_translation.attributes
    end

    assert_redirected_to announces_translation_path(assigns(:announces_translation))
  end

  test "should show announces_translation" do
    get :show, :id => @announces_translation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @announces_translation.to_param
    assert_response :success
  end

  test "should update announces_translation" do
    put :update, :id => @announces_translation.to_param, :announces_translation => @announces_translation.attributes
    assert_redirected_to announces_translation_path(assigns(:announces_translation))
  end

  test "should destroy announces_translation" do
    assert_difference('AnnouncesTranslation.count', -1) do
      delete :destroy, :id => @announces_translation.to_param
    end

    assert_redirected_to announces_translations_path
  end
end
