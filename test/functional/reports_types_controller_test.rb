require 'test_helper'

class ReportsTypesControllerTest < ActionController::TestCase
  setup do
    @reports_type = reports_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reports_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reports_type" do
    assert_difference('ReportsType.count') do
      post :create, :reports_type => @reports_type.attributes
    end

    assert_redirected_to reports_type_path(assigns(:reports_type))
  end

  test "should show reports_type" do
    get :show, :id => @reports_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @reports_type.to_param
    assert_response :success
  end

  test "should update reports_type" do
    put :update, :id => @reports_type.to_param, :reports_type => @reports_type.attributes
    assert_redirected_to reports_type_path(assigns(:reports_type))
  end

  test "should destroy reports_type" do
    assert_difference('ReportsType.count', -1) do
      delete :destroy, :id => @reports_type.to_param
    end

    assert_redirected_to reports_types_path
  end
end
