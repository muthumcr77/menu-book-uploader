# frozen_string_literal: true

class Restaurant < ApplicationRecord
  # ASSOCIATIONS
  has_one :restaurant_menu, dependent: :destroy
  has_many :restaurant_menu_items, through: :restaurant_menu

  # VALIDATIONS
  validates :name, presence: true
  validates :name, uniqueness: true
end
