class AddReferenceToRestaurantMenuItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :restaurant_menu_items, :restaurant_menu_item_category, null: false, foreign_key: true
  end
end
