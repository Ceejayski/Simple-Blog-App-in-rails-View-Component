require "test_helper"

class Groups::MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get groups_members_create_url
    assert_response :success
  end

  test "should get destroy" do
    get groups_members_destroy_url
    assert_response :success
  end
end
