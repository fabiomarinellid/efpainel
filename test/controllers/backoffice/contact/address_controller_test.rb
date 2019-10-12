require 'test_helper'

class Backoffice::Contact::AddressControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_contact_address_index_url
    assert_response :success
  end

  test "should get edit" do
    get backoffice_contact_address_edit_url
    assert_response :success
  end

end
