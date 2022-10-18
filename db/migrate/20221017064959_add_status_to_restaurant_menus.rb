# frozen_string_literal: true

class AddStatusToRestaurantMenus < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurant_menus, :status, :integer
  end
end
