class RestaurantMenusController < ApplicationController

  # CALLBACKS
  before_action :load_restaurant

  def index
    @restaurant_menu = @restaurant.restaurant_menus.last
  end

  def new
    @restaurant_menu = @restaurant.restaurant_menus.new
  end

  def create
    @restaurant_menu = @restaurant.restaurant_menus.new(restaurant_menu_params)
    if @restaurant_menu.save
      # redirect to file being processed page to display menu
      redirect_to root_path, notice: "Your menu is being processed"
    else
      flash[:alert] = "Error! Try again."
      render :new
    end
  end

  private
  def restaurant_menu_params
    params.require(:restaurant_menu).permit(:menu_file)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
