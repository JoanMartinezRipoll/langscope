require 'test_helper'

class ScopeControllerTest < ActionController::TestCase
  test "should get myscope" do
    get :myscope
    assert_response :success
  end

end
