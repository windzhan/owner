require 'test_helper'

class CatonesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get catones_home_url
    assert_response :success
  end

end
