require "test_helper"

class ProducttypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get producttypes_index_url
    assert_response :success
  end

  test "should get show" do
    get producttypes_show_url
    assert_response :success
  end
end
