require 'test_helper'

class Backoffice::Product::LabelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_product_label_index_url
    assert_response :success
  end

  test "should get edit" do
    get backoffice_product_label_edit_url
    assert_response :success
  end

end
