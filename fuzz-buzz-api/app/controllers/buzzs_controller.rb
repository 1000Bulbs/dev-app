class BuzzsController < ApplicationController
  def index
    buzzs = Buzz.all
    render json: buzzs
  end

  def show
    buzz = Buzz.find(params[:id])
    render json: buzz
  end
end
