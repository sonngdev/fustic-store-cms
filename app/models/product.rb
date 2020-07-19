class Product < ApplicationRecord
  belongs_to :category

  has_one :image_manager, class_name: 'ProductImageManager', dependent: :destroy

  has_many_attached :images

  def thumbnail
    images.find_by(id: image_manager.thumbnail_id)
  end

  def alt_thumbnail
    images.find_by(id: image_manager.alt_thumbnail_id)
  end
end
