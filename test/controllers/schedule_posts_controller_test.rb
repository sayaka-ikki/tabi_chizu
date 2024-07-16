require "test_helper"

class SchedulePostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get schedule_posts_new_url
    assert_response :success
  end

  test "should get index" do
    get schedule_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get schedule_posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get schedule_posts_edit_url
    assert_response :success
  end
end
