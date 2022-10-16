class ChangeColumnNullAllergensOfRestaurantMenuItems < ActiveRecord::Migration[7.0]
  def change
    change_column_null :restaurant_menu_items, :allergens, true
  end
end
