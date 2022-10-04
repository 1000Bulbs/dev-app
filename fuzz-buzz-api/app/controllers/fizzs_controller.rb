class FizzsController < ApplicationController
  def index
    fizzs = Fizz.all
    render json: fizzs
  end

  def show
    fizz = Fizz.find(params[:id])
    render json: fizz
  end
end
