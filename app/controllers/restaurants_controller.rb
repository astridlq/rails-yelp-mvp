class RestaurantsController < ApplicationController
  before_action :set_restau, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restau_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def restau_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restau
    @restaurant = Restaurant.find(params[:id])
  end

end
