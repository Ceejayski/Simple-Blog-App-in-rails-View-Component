require "test_helper"

class Groups::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @groups_post = groups_posts(:one)
  end

  test "should get index" do
    get groups_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_groups_post_url
    assert_response :success
  end

  test "should create groups_post" do
    assert_difference("Groups::Post.count") do
      post groups_posts_url, params: { groups_post: { create: @groups_post.create, delete: @groups_post.delete, index: @groups_post.index, show: @groups_post.show } }
    end

    assert_redirected_to groups_post_url(Groups::Post.last)
  end

  test "should show groups_post" do
    get groups_post_url(@groups_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_groups_post_url(@groups_post)
    assert_response :success
  end

  test "should update groups_post" do
    patch groups_post_url(@groups_post), params: { groups_post: { create: @groups_post.create, delete: @groups_post.delete, index: @groups_post.index, show: @groups_post.show } }
    assert_redirected_to groups_post_url(@groups_post)
  end

  test "should destroy groups_post" do
    assert_difference("Groups::Post.count", -1) do
      delete groups_post_url(@groups_post)
    end

    assert_redirected_to groups_posts_url
  end
end
