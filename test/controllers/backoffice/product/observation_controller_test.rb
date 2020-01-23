require 'test_helper'

class Backoffice::Product::ObservationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_product_observation_index_url
    assert_response :success
  end

  test "should get edit" do
    get backoffice_product_observation_edit_url
    assert_response :success
  end

  test "should get new" do
    get backoffice_product_observation_new_url
    assert_response :success
  end

end
