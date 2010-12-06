require 'test_helper'

class NewslettersTypesControllerTest < ActionController::TestCase
  setup do
    @newsletters_type = newsletters_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:newsletters_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create newsletters_type" do
    assert_difference('NewslettersType.count') do
      post :create, :newsletters_type => @newsletters_type.attributes
    end

    assert_redirected_to newsletters_type_path(assigns(:newsletters_type))
  end

  test "should show newsletters_type" do
    get :show, :id => @newsletters_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @newsletters_type.to_param
    assert_response :success
  end

  test "should update newsletters_type" do
    put :update, :id => @newsletters_type.to_param, :newsletters_type => @newsletters_type.attributes
    assert_redirected_to newsletters_type_path(assigns(:newsletters_type))
  end

  test "should destroy newsletters_type" do
    assert_difference('NewslettersType.count', -1) do
      delete :destroy, :id => @newsletters_type.to_param
    end

    assert_redirected_to newsletters_types_path
  end
end
