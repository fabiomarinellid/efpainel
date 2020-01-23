require 'test_helper'

class Backoffice::Config::AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_config_about_index_url
    assert_response :success
  end

end
