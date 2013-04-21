class FramesController < ApplicationController
  # load_and_authorize_resource through: :game
  load_and_authorize_resource :game
  load_and_authorize_resource :frame, through: :game

  def index
  end

  def create
  end

  def edit
  end

  def update
  end
end
