def find_fizzbuzz start, finish
  a = (start..finish).to_a
  a.each_with_index do |x, i|
    case
      when x == 0 then x = x
      when x % 15 == 0 then x = "FizzBuzz"
      when x % 5  == 0 then x = "Buzz"
      when x % 3  == 0 then x = "Fizz"
      else x
    end
    a[i] = x
  end
rescue
  'bad value for range'
end
