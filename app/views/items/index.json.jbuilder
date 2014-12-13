json.array!(@items) do |item|
  json.extract! item, :id, :title, :description, :image_url, :url, :user_id
  json.url item_url(item, format: :json)
end
