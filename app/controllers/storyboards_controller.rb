class StoryboardsController < ApplicationController
  include GetStoryboardViewers
  include SetStoryboardViewer
  before_filter :find, only: [:show, :update, :set_viewer, :get_viewers]
  def find
    @storyboard = Storyboard.find(params[:id])
  end

  # GET /storyboards
  def index
    @storyboards = designer.storyboards.all
    render json: @storyboards
  end

  # GET /storyboards/1
  def show
    render json: @storyboard
  end

  # POST /storyboards
  def create
    @storyboard = Storyboard.new(params[:storyboard])
    if @storyboard.save
      render json: @storyboard, status: :created, location: @storyboard
    else
      render json: @storyboard.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /storyboards/1
  def update
    if @storyboard.update(params[:storyboard])
      head :no_content
    else
      render json: @storyboard.errors, status: :unprocessable_entity
    end
  end

  # DELETE /storyboards/1
  def destroy
    # @storyboard.destroy
    head :no_content
  end
end
