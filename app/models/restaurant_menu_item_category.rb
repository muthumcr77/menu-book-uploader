class RestaurantMenuItemCategory < ApplicationRecord

  # ASSOCIATIONS
  belongs_to :restaurant_menu
  has_many :restaurant_menu_items, dependent: :destroy

  # VALIDATIONS
  validates :name, presence: true
  validates :name, uniqueness: true
end
