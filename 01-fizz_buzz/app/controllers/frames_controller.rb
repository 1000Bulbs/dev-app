class FramesController < ApplicationController
  load_and_authorize_resource :game
  load_and_authorize_resource :frame, through: :game

  respond_to :html, :json

  def index
  end

  def create
    @frame.save

    respond_with @frame, location: nil
  end

  def edit
    @next_frame_id = @frame.lower_item.id if @frame.lower_item
  end

  def update
    @frame.update_attributes(params[:frame])

    respond_with @frame do |format|
      format.json { render json: @frame.to_json }
    end
  end
end
