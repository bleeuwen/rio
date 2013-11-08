json.array!(@orders) do |order|
  json.extract! order, :Ordernr, :UserId, :Opmerking
  json.url order_url(order, format: :json)
end