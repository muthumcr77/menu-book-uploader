class Restaurant < ApplicationRecord
  
  # ASSOCIATIONS
  has_many :restaurant_menu
  has_many :restaurant_menu_items, through: :restaurant_menu

  # VALIDATIONS
  validates :name, presence: true
end
