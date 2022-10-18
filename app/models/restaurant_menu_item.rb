# frozen_string_literal: true

class RestaurantMenuItem < ApplicationRecord
  # FOOD TYPE
  enum :dish_type, [:non_veg, :veg]

  # ASSOCIATIONS
  belongs_to :restaurant_menu
  belongs_to :restaurant_menu_item_category

  # VALIDATIONS
  validates :dish_name, :dish_desc, :dish_type, :price, presence: true
end
