class Api::V1::FizzBuzzController < ApplicationController
  def index
    result = []
    (1..100).map {|i|
      fizz = i % 3 == 0 ? 'Fizz' : nil
      buzz = i % 5 == 0 ? 'Buzz' : nil
      result << (fizz.present? || buzz.present? ? "#{ fizz }#{ buzz }" : i)
    }
    render json: result, status: :ok
  end
end
