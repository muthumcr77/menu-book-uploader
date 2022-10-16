class CreateRestaurantMenuItemCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurant_menu_item_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
