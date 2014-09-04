require 'test_helper'

class FizzBuzzFlowTest < ActionDispatch::IntegrationTest

  test "get some multiples of three" do
    assert getsThree(3)
    assert_not getsThree(4)
    assert_not getsThree(5)
    assert getsThree(6)
    assert getsThree(15)
    assert getsThree(30)
    assert getsThree(45)
  end

  test "get some multiples of five" do
    assert_not getsFive(3)
    assert_not getsFive(4)
    assert getsFive(5)
    assert_not getsFive(6)
    assert getsFive(15)
    assert getsFive(30)
    assert getsFive(45)
  end

  private

  def getsThree(val)
    get "/isMultOfThree/#{val}"
    assert_response :success
    assert assigns(:result)
    assigns(:result)['result']
  end

  def getsFive(val)
    get "/isMultOfFive/#{val}"
    assert_response :success
    assert assigns(:result)
    assigns(:result)['result']
  end

end
