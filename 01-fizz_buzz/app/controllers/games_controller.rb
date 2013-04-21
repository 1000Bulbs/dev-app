class GamesController < ApplicationController
  load_and_authorize_resource through: current_user

  respond_to :json

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
