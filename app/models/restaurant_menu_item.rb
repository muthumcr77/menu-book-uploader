class RestaurantMenuItem < ApplicationRecord

  # ASSOCIATIONS
  belongs_to :restaurant_menu

  # VALIDATIONS
  validates :dish_name, :dish_desc, :dish_type, :allergens, :category, :price, presence: true
end
