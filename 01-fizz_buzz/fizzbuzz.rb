def fizzbuzz(x)
  case
    when x % 15 == 0 then "FizzBuzz"
    when x % 5  == 0 then "Buzz"
    when x % 3  == 0 then "Fizz"
    else x
  end
end
