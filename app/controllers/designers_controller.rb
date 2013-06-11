class DesignersController < ApplicationController
  wrap_parameters :designer, include: [:email, :avatar_url]
  skip_before_filter :authenticate!, only: [:create]
  before_filter :find, only: [:show, :update]

  def find
    @designer = Designer.find(params[:id])
  end

  # GET /designers
  def index
    # @designers = Designer.all
    @designers = []
    designer.storyboards.each {|s| 
      s.designers.each {|d|
        @designers << d
      }
    }
    render json: @designers, :except => [:auth_token]
  end

  # GET /designers/1
  def show
    render json: @designer, :except => [:auth_token]
  end

  # POST /designers
  def create
    @designer = Designer.new(params[:designer])
    if @designer.save
      head status: :created, location: @designer, auth_token: @designer.auth_token
    else
      render json: @designer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /designers/1
  def update
    if @designer.update(params[:designer])
      head :no_content
    else
      render json: @designer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /designers/1
  def destroy
    # @designer.destroy
    head :no_content
  end
end
