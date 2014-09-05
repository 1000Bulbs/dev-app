class FizzBuzzController < ApplicationController
  respond_to :json

  def fizzBuzz
    fbData = []
    for i in 1..100
      if i % 3 == 0 && i % 5 == 0 then 
        fbData[i] = 'FizzBuzz'
      elsif i % 3 == 0 then 
        fbData[i] = 'Fizz'
      elsif i % 5 == 0 then
        fbData[i] = 'Buzz'
      else
        fbData[i] = i
      end
    end
    
    respond_with(fbData.compact!)
  end
end
