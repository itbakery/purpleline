require 'test_helper'

class PagesTranslationControllerTest < ActionController::TestCase
  test "should get page_id:integer" do
    get :page_id:integer
    assert_response :success
  end

  test "should get language_id:integer" do
    get :language_id:integer
    assert_response :success
  end

  test "should get title:string" do
    get :title:string
    assert_response :success
  end

  test "should get content:text" do
    get :content:text
    assert_response :success
  end

  test "should get publish:boolean" do
    get :publish:boolean
    assert_response :success
  end

  test "should get starton:date" do
    get :starton:date
    assert_response :success
  end

  test "should get stopon:date" do
    get :stopon:date
    assert_response :success
  end

end
