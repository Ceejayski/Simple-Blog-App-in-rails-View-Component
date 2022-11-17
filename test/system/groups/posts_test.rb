require "application_system_test_case"

class Groups::PostsTest < ApplicationSystemTestCase
  setup do
    @groups_post = groups_posts(:one)
  end

  test "visiting the index" do
    visit groups_posts_url
    assert_selector "h1", text: "Posts"
  end

  test "should create post" do
    visit groups_posts_url
    click_on "New post"

    fill_in "Create", with: @groups_post.create
    fill_in "Delete", with: @groups_post.delete
    fill_in "Index", with: @groups_post.index
    fill_in "Show", with: @groups_post.show
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "should update Post" do
    visit groups_post_url(@groups_post)
    click_on "Edit this post", match: :first

    fill_in "Create", with: @groups_post.create
    fill_in "Delete", with: @groups_post.delete
    fill_in "Index", with: @groups_post.index
    fill_in "Show", with: @groups_post.show
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "should destroy Post" do
    visit groups_post_url(@groups_post)
    click_on "Destroy this post", match: :first

    assert_text "Post was successfully destroyed"
  end
end
