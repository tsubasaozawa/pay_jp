require 'test_helper'

class PurchaseControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get purchase_show_url
    assert_response :success
  end

  test "should get done" do
    get purchase_done_url
    assert_response :success
  end

end
