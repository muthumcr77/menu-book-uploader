# frozen_string_literal: true

class CreateRestaurantMenuItems < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurant_menu_items do |t|
      t.string :dish_name
      t.string :dish_desc
      t.integer :dish_type
      t.string :allergens
      t.string :category
      t.integer :price
      t.references :restaurant_menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
