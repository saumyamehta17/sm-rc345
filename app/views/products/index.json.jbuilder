json.array!(@products) do |product|
  json.extract! product, :id, :prod_name, :properties
  json.url product_url(product, format: :json)
end
