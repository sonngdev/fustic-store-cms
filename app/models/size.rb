class Size < ApplicationRecord
  has_many :products_sizes, dependent: :destroy
  has_many :products, through: :products_sizes
end
