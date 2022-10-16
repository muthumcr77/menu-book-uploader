class AddReferenceToRestaurantMenuItemCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :restaurant_menu_item_categories, :restaurant_menu, null: false, foreign_key: true
  end
end
