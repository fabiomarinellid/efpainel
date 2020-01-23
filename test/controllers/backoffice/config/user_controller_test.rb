require 'test_helper'

class Backoffice::Config::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_config_user_index_url
    assert_response :success
  end

  test "should get edit" do
    get backoffice_config_user_edit_url
    assert_response :success
  end

  test "should get new" do
    get backoffice_config_user_new_url
    assert_response :success
  end

end
