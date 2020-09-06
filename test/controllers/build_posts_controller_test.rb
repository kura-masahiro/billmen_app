require 'test_helper'

class BuildPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get build_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get build_posts_show_url
    assert_response :success
  end

  test "should get new" do
    get build_posts_new_url
    assert_response :success
  end

  test "should get edit" do
    get build_posts_edit_url
    assert_response :success
  end

end
