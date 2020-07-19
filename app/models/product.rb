class Product < ApplicationRecord
  alias_attribute :manager, :product_image_manager

  belongs_to :category

  has_one :product_image_manager

  has_many_attached :images

  def thumbnail
    images.find_by(id: manager.thumbnail_id)
  end

  def alt_thumbnail
    images.find_by(id: manager.alt_thumbnail_id)
  end
end
