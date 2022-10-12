module FizzBuzz
  def print_fizz_buzz(number)
    arr = []
    (1..number).map do |num|
      fizz_buzz = ''
      fizz_buzz += 'Fizz' if num % 3 == 0
      fizz_buzz += 'Buzz' if num % 5 == 0
      fizz_buzz = num unless num % 3 == 0 || num % 5 == 0
      arr.append(fizz_buzz)
    end
    arr
  end
end