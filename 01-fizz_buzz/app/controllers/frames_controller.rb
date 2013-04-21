class FramesController < ApplicationController
  load_and_authorize_resource through: :game

  def create
  end

  def update
  end
end
