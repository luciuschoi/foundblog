json.array!(@categories) do |category|
  json.extract! category, :id, :user_id, :name
  json.url category_url(category, format: :json)
end
