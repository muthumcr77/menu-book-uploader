class RemoveCategoryFromRestaurantMenuItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :restaurant_menu_items, :category
  end
end
