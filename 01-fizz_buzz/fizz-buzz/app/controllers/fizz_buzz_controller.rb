class FizzBuzzController < ApplicationController
  respond_to :json

  def isFizz
    calcAndRespond(3)
  end

  def isBuzz
    calcAndRespond(5)
  end

  def isFizzBuzz
    dividend = params[:val].to_i
    fb = dividend % 3 == 0 && dividend % 5 == 0
    @result = { "val" => dividend, "result" => fb }

    respond_with(@result)
  end

  private

  def calcAndRespond(divisor)
    dividend = params[:val].to_i
    fizz = dividend % divisor == 0
    @result = { "val" => dividend, "result" => fizz }

    respond_with(@result)
  end

end
