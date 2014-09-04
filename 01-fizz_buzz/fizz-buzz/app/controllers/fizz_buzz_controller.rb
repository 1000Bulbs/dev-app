class FizzBuzzController < ApplicationController
  respond_to :json

  def isMultOfThree
    calcAndRespond(3)
  end

  def isMultOfFive
    calcAndRespond(5)
  end

  private

  def calcAndRespond(divisor)
    dividend = params[:val].to_i
    fizz = dividend % divisor == 0
    @result = { "val" => dividend, "result" => fizz }

    respond_with(@result)
  end

end
