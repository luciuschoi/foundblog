require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get readme" do
    get :readme
    assert_response :success
  end

end
