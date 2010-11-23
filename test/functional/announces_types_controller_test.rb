require 'test_helper'

class AnnouncesTypesControllerTest < ActionController::TestCase
  setup do
    @announces_type = announces_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:announces_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create announces_type" do
    assert_difference('AnnouncesType.count') do
      post :create, :announces_type => @announces_type.attributes
    end

    assert_redirected_to announces_type_path(assigns(:announces_type))
  end

  test "should show announces_type" do
    get :show, :id => @announces_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @announces_type.to_param
    assert_response :success
  end

  test "should update announces_type" do
    put :update, :id => @announces_type.to_param, :announces_type => @announces_type.attributes
    assert_redirected_to announces_type_path(assigns(:announces_type))
  end

  test "should destroy announces_type" do
    assert_difference('AnnouncesType.count', -1) do
      delete :destroy, :id => @announces_type.to_param
    end

    assert_redirected_to announces_types_path
  end
end
