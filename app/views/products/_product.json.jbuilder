json.extract! product, :id, :name, :slug, :price_vnd, :price_usd, :created_at, :updated_at

json.category do
  json.merge! product.category.as_json
  json.singular_name product.category.name.singularize
end

manager = product.image_manager
sorted_images = product.images.sort_by {|image| manager.order.index(image.id) }
json.images sorted_images do |image|
  json.url polymorphic_url(image)
  json.is_thumbnail image.id == manager.thumbnail_id
  json.is_alt_thumbnail image.id == manager.alt_thumbnail_id
  json.created_at image.created_at
end

json.sizes product.products_sizes do |ps|
  json.name ps.size.name
  json.in_stock ps.quantity > 0
end
