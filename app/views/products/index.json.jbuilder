json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :company, :count, :published
  json.url product_url(product, format: :json)
end
