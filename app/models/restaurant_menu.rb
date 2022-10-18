# frozen_string_literal: true

class RestaurantMenu < ApplicationRecord
  # Valid file formats
  FILE_TYPES = ["text/csv", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/vnd.ms-excel"]

  # JOB STATUS
  enum :status, [:loading, :success]

  # ASSOCIATIONS
  belongs_to :restaurant
  has_many :restaurant_menu_item_categories, dependent: :destroy
  has_many :restaurant_menu_items, through: :restaurant_menu_item_categories

  # ATTACHMENTS
  has_one_attached :menu_file

  # VALIDATIONS
  validates :menu_file, presence: true
  validate :menu_file_type_validation, on: :create

  private

    def menu_file_type_validation
      if menu_file.attached?
        if !FILE_TYPES.include?(menu_file.blob.content_type)
          errors.add(:base, "Invalid file format! Please try again.")
        end
      end
    end
end
