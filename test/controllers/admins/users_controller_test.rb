require 'test_helper'

class Admins::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get admins_users_search_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_users_destroy_url
    assert_response :success
  end

end
