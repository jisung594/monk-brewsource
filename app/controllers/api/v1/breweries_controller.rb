class Api::V1::BreweriesController < ApplicationController
  before_action :find_brewery, only: [:show, :update]
  def index
    @breweries = Brewery.all
    render json: @breweries
  end

  def show
    render json: @brewery
  end

  def update
    @brewery.update(brewery_params)
    if @brewery.save
      render json: @brewery, status: :accepted
    else
      render json: { errors: @brewery.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def brewery_params
    params.permit(:name, :style, :description, :abv, :brewery)
  end

  def find_brewery
    @brewery = Brewery.find(params[:id])
  end
end
