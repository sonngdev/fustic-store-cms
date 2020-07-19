class Product < ApplicationRecord
  belongs_to :category

  has_one :product_image_manager
end
