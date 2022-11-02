require "test_helper"

class FizzbuzzControllerTest < ActionDispatch::IntegrationTest
  test "should get fizz" do
    get fizzbuzz_fizz_url
    assert_response :success
  end
end
