class ChangeColumnNullAllergensOfRestaurantMenuItems < ActiveRecord::Migration[7.0]
  def change
    change_column_null :restaurant_menu_items, :allergens, true
    change_column_default :restaurant_menu_items, :allergens, ""
  end
end
