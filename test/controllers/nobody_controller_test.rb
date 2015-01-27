require 'test_helper'

class NobodyControllerTest < ActionController::TestCase
  test "should get access_denied" do
    get :access_denied
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

end
