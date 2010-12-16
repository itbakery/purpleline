require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get page" do
    get :page
    assert_response :success
  end

end
