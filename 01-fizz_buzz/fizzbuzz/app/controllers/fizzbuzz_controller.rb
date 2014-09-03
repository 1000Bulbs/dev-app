class FizzbuzzController < ApplicationController

def fizzbuzz(num)
  case
  when num % 15 == 0 then "FizzBuzz"
  when num % 3  == 0 then "Fizz"
  when num % 5  == 0 then "Buzz"
  else num
  end
end

def show
  
end

def index
  if params[:num]
     @num = params[:num]
     #puts fizzbuzz num.to_i
     @fizztext = fizzbuzz @num.to_i
     if @fizztext == 'Fizz'
       @mod = '3'
     elsif @fizztext == 'Buzz'
       @mod = '5'
     elsif @fizztext == 'FizzBuzz'
       @mod = '15'
     end
     
  end
end

end
