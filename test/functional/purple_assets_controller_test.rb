require 'test_helper'

class PurpleAssetsControllerTest < ActionController::TestCase
  setup do
    @purple_asset = purple_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purple_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purple_asset" do
    assert_difference('PurpleAsset.count') do
      post :create, :purple_asset => @purple_asset.attributes
    end

    assert_redirected_to purple_asset_path(assigns(:purple_asset))
  end

  test "should show purple_asset" do
    get :show, :id => @purple_asset.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @purple_asset.to_param
    assert_response :success
  end

  test "should update purple_asset" do
    put :update, :id => @purple_asset.to_param, :purple_asset => @purple_asset.attributes
    assert_redirected_to purple_asset_path(assigns(:purple_asset))
  end

  test "should destroy purple_asset" do
    assert_difference('PurpleAsset.count', -1) do
      delete :destroy, :id => @purple_asset.to_param
    end

    assert_redirected_to purple_assets_path
  end
end
