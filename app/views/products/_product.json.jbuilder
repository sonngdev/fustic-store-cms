json.extract! product, :id, :name, :slug, :price_vnd, :price_usd, :created_at, :updated_at
json.url product_url(product, format: :json)
