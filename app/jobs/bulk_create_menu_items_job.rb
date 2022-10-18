# frozen_string_literal: true

require "csv"

class BulkCreateMenuItemsJob < ApplicationJob
  sidekiq_options queue: "default"
  queue_as :default
  attr_accessor :restaurant_menu

  after_perform do |job|
    @restaurant_menu.success!
    puts "Job status: #{@restaurant_menu.status}"
  end

  def perform(restaurant_menu_id)
    @restaurant_menu = RestaurantMenu.find(restaurant_menu_id)
    file_path = ActiveStorage::Blob.service.path_for(@restaurant_menu.menu_file.key)
    @restaurant_menu.transaction do
      CSV.foreach(file_path, quote_char: '"', headers: true, header_converters: :symbol) do |row|
        category = RestaurantMenuItemCategory.find_by(name: row[:category], restaurant_menu_id: @restaurant_menu.id)
        category = RestaurantMenuItemCategory.create!(name: row[:category], restaurant_menu_id: @restaurant_menu.id) if category.nil?
        row[:dish_type].downcase.include?("non-veg") ? dish_type = 0 : dish_type = 1
        restaurant_menu_item = RestaurantMenuItem.create!(
          {
            dish_name: row[:dish_name],
            dish_desc: row[:dish_description],
            dish_type:,
            allergens: row[:allergens] || "",
            price: row[:price].to_i,
            restaurant_menu_id: @restaurant_menu.id,
            restaurant_menu_item_category_id: category.id
          }
        )
        puts "Error creating record! Please check again." unless restaurant_menu_item.present?
      end
    end
    rescue ActiveRecord::RecordInvalid => exception
      puts exception.message
  end
end
