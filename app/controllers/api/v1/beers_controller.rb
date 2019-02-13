class Api::V1::BeersController < ApplicationController
  before_action :find_beer, only: [:show, :update]
  def index
    @beers = Beer.all
    render json: @beers
  end

  def show
    render json: @beer
  end

  def update
    @beer.update(beer_params)
    if @beer.save
      render json: @beer, status: :accepted
    else
      render json: { errors: @beer.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def beer_params
    params.permit(:name, :style, :description, :abv, :brewery)
  end

  def find_beer
    @beer = Beer.find(params[:id])
  end
end
