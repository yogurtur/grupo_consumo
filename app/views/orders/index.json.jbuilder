json.array!(@orders) do |order|
  json.extract! order, :id, :order_status, :payment_method, :shipping_address, :shipping_city, :customer_name, :customer_lastname
  json.url order_url(order, format: :json)
end
