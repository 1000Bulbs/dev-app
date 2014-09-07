# test_fizzbuzz.rb
require File.expand_path '../test_helper.rb', __FILE__
require './fizzbuzz'

class MyTest < MiniTest::Unit::TestCase

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_number_divisable_by_three
    num = find_fizzbuzz 1, 4
    assert_equal(num, [1, 2, "Fizz", 4])
  end

  def test_number_divisable_by_five
    num = find_fizzbuzz 4, 5
    assert_equal(num, [4, "Buzz"])
  end

  def test_number_divisable_by_three_and_five
    num = find_fizzbuzz 14, 16
    assert_equal(num, [14, "FizzBuzz", 16])
  end

  def test_return_error_when_non_interger_is_passed
    num = find_fizzbuzz 5, 'z'
    assert_equal(num, 'bad value for range')
  end
  
end
