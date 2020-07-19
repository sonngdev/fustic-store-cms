class Product < ApplicationRecord
  belongs_to :category

  has_one :product_image_manager

  has_many_attached :images
end
