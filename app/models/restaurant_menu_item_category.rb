# frozen_string_literal: true

class RestaurantMenuItemCategory < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :restaurant_menu
  has_many :restaurant_menu_items, dependent: :destroy

  # VALIDATIONS
  validates :name, presence: true
  validates :name, uniqueness: { scope: [:restaurant_menu_id] }
end
