require "test_helper"

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get index_index_url
    assert_response :success
  end

  test "should get calculate" do
    get index_calculate_url
    assert_response :success
  end
end
