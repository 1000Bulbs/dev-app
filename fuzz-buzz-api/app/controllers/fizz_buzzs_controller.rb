class FizzBuzzsController < ApplicationController
  def index
    fizz_buzzs = FizzBuzz.all
    render json: fizz_buzzs
  end

  def show
    fizz_buzz = FizzBuzz.find(params[:id])
    render json: fizz_buzz
  end
end
