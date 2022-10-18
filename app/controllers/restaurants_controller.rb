# frozen_string_literal: true

class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all rescue []
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      # redirect restaurant menu upload path here
      redirect_to restaurants_path, notice: "New restaurant #{@restaurant.name} created successfully!"
    else
      render :new
    end
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name)
    end
end
