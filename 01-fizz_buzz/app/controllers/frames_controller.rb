class FramesController < ApplicationController
  load_and_authorize_resource :game
  load_and_authorize_resource :frame, through: :game

  respond_to :html, :json

  def index
  end

  def new
    redirect_to action: :create # Oh no idempotent-o!
    # render nothing: true
  end

  def create
    throw "here"
    @frame.save

    respond_with @frame
  end

  def edit
  end

  def update
  end
end
