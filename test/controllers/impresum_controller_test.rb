require "test_helper"

class ImpresumControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get impresum_url
    assert_response :success
  end
end
