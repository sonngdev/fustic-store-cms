json.products @products do |product|
  json.partial! "products/product", product: product
end
