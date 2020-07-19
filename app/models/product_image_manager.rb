class ProductImageManager < ApplicationRecord
  serialize :order

  belongs_to :product

  validates :product_id, uniqueness: true
end
