require './fizzbuzz'
require 'test/unit'
require 'rack/test'

class FizzBuzzTest < Test::Unit::TestCase
  def test_number_divisable_by_three
    num = fizzbuzz(9)
    assert_equal(num,'Fizz')
  end
  
  def test_number_divisable_by_five
    num = fizzbuzz(10)
    assert_equal(num,'Buzz')
  end
  
  def test_number_divisable_by_fifteen
    num = fizzbuzz(30)
    assert_equal(num,'FizzBuzz')
  end
  
  def test_number_divisable_by_three_five_or_fifteen
    num = fizzbuzz(7)
    assert_equal(num,7)
  end
end
