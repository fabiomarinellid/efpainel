require 'test_helper'

class Backoffice::Product::ProductControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_product_product_index_url
    assert_response :success
  end

  test "should get edit" do
    get backoffice_product_product_edit_url
    assert_response :success
  end

end
