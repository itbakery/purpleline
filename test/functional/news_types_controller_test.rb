require 'test_helper'

class NewsTypesControllerTest < ActionController::TestCase
  setup do
    @news_type = news_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:news_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create news_type" do
    assert_difference('NewsType.count') do
      post :create, :news_type => @news_type.attributes
    end

    assert_redirected_to news_type_path(assigns(:news_type))
  end

  test "should show news_type" do
    get :show, :id => @news_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @news_type.to_param
    assert_response :success
  end

  test "should update news_type" do
    put :update, :id => @news_type.to_param, :news_type => @news_type.attributes
    assert_redirected_to news_type_path(assigns(:news_type))
  end

  test "should destroy news_type" do
    assert_difference('NewsType.count', -1) do
      delete :destroy, :id => @news_type.to_param
    end

    assert_redirected_to news_types_path
  end
end
