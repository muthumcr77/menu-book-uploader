class RestaurantMenu < ApplicationRecord

  # ASSOCIATIONS
  belongs_to :restaurant
  has_many :restaurant_menu_items

  # ATTACHMENTS
  has_one_attached :menu_file
end
