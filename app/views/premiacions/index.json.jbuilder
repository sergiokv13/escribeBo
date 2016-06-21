json.array!(@premiacions) do |premiacion|
  json.extract! premiacion, :id, :title, :date_of, :user_id
  json.url premiacion_url(premiacion, format: :json)
end
