require "test_helper"

class FavoritePostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get favorite_posts_new_url
    assert_response :success
  end

  test "should get index" do
    get favorite_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get favorite_posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get favorite_posts_edit_url
    assert_response :success
  end
end
