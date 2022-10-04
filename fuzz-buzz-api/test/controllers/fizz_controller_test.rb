require "test_helper"

class FizzControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get fizz_name:string_url
    assert_response :success
  end
end
