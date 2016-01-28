json.array!(@buy_orders) do |buy_order|
  json.extract! buy_order, :id, :name, :number_order, :date_delivery, :date_order, :payment
  json.url buy_order_url(buy_order, format: :json)
end
