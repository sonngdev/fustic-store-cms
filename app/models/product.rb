class Product < ApplicationRecord
  belongs_to :category

  has_one :image_manager, class_name: 'ProductImageManager', dependent: :destroy

  has_many :products_sizes, dependent: :destroy
  has_many :sizes, through: :products_sizes
  has_many_attached :images

  def thumbnail
    images.find_by(id: image_manager.thumbnail_id)
  end

  def alt_thumbnail
    images.find_by(id: image_manager.alt_thumbnail_id)
  end

  def quantity_of_size(size)
    products_sizes.find_by(size_id: size.id)&.quantity
  end
end
