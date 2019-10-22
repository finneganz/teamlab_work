require 'test_helper'

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get static_page_index_url
    assert_response :success
  end

  test "should get about" do
    get static_page_about_url
    assert_response :success
  end

  test "should get help" do
    get static_page_help_url
    assert_response :success
  end

  test "should get contact" do
    get static_page_contact_url
    assert_response :success
  end

end
