json.extract! product, :id, :content, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
