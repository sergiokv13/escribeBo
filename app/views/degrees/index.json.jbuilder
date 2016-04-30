json.array!(@degrees) do |degree|
  json.extract! degree, :id, :title, :user_id
  json.url degree_url(degree, format: :json)
end
