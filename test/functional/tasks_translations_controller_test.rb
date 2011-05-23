require 'test_helper'

class TasksTranslationsControllerTest < ActionController::TestCase
  setup do
    @tasks_translation = tasks_translations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks_translations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tasks_translation" do
    assert_difference('TasksTranslation.count') do
      post :create, :tasks_translation => @tasks_translation.attributes
    end

    assert_redirected_to tasks_translation_path(assigns(:tasks_translation))
  end

  test "should show tasks_translation" do
    get :show, :id => @tasks_translation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tasks_translation.to_param
    assert_response :success
  end

  test "should update tasks_translation" do
    put :update, :id => @tasks_translation.to_param, :tasks_translation => @tasks_translation.attributes
    assert_redirected_to tasks_translation_path(assigns(:tasks_translation))
  end

  test "should destroy tasks_translation" do
    assert_difference('TasksTranslation.count', -1) do
      delete :destroy, :id => @tasks_translation.to_param
    end

    assert_redirected_to tasks_translations_path
  end
end
