#!/usr/bin/env ruby

USAGE_INTRO = IO.read("#{File.dirname(__FILE__)}/art/ascii_intro.txt")

def fizzbuzz_math(max_value)
  if max_value.to_i <= 0
    puts "Maximum value must be a number greater than 0"
    exit
  else
    max_value = max_value.to_i
  end

  nums = (1..max_value).to_a

  output = nums.map do |n|
    if n % 3 == 0 && n % 5 == 0
      "FizzBuzz"
    elsif n % 3 == 0
      "Fizz"
    elsif n % 5 == 0
      "Buzz"
    else
      n
    end
  end
end

if $0 == __FILE__
  unless ARGV.length > 0
    puts USAGE_INTRO
    exit
  end

  puts fizzbuzz_math(ARGV.join(' '))
end
