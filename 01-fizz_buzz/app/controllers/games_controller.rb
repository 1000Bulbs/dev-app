class GamesController < ApplicationController
  load_and_authorize_resource through: :current_user

  respond_to :html, :json

  def index
  end

  def show
    redirect_to new_game_frame_path(@game)
  end

  def new
  end

  def create
    @game.save

    respond_with @game, location: edit_game_frame_path(@game, @game.first_frame)
  end

  def update
  end

  def destroy
  end
end
