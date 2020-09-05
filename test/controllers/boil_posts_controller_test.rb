require 'test_helper'

class BoilPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get boil_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get boil_posts_show_url
    assert_response :success
  end

  test "should get new" do
    get boil_posts_new_url
    assert_response :success
  end

  test "should get create" do
    get boil_posts_create_url
    assert_response :success
  end

  test "should get edit" do
    get boil_posts_edit_url
    assert_response :success
  end

  test "should get update" do
    get boil_posts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get boil_posts_destroy_url
    assert_response :success
  end

end
