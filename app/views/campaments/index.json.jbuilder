json.array!(@campaments) do |campament|
  json.extract! campament, :id, :name, :president_id
  json.url campament_url(campament, format: :json)
end
