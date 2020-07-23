json.categories @categories do |category|
  json.partial! "categories/category", category: category
end
