json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :admission_at, :manufacturer, :quantity, :price, :product_category
  json.url product_url(product, format: :json)
end
