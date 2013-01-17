require 'test_helper'

class CartControllerTest < ActionController::TestCase
  test "should get add_item" do
    get :add_item
    assert_response :success
  end

  test "should get remove_item" do
    get :remove_item
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
