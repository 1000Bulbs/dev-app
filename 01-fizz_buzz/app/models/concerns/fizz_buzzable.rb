module FizzBuzzable
  extend ActiveSupport::Concern

  def fizz_buzzify(number)
    result = ''

    result += 'Fizz' if fizz?(number)
    result += 'Buzz' if buzz?(number)
    result = number if result.empty?
    result
  end

  def fizz?(number)
    number % 3 == 0
  end

  def buzz?(number)
    number % 5 == 0
  end
end
