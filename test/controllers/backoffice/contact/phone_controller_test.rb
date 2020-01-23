require 'test_helper'

class Backoffice::Contact::PhoneControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_contact_phone_index_url
    assert_response :success
  end

  test "should get edit" do
    get backoffice_contact_phone_edit_url
    assert_response :success
  end

end
