json.array!(@order_regels) do |order_regel|
  json.extract! order_regel, :order_id, :artikel_id, :aantal, :Opmerking
  json.url order_regel_url(order_regel, format: :json)
end