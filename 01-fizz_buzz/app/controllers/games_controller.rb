class GamesController < ApplicationController
  load_and_authorize_resource through: :current_user

  respond_to :html, :json

  def index
  end

  def show
  end

  def new
  end

  def create
    @game.save

    respond_with @game
  end

  def update
  end

  def destroy
  end
end
