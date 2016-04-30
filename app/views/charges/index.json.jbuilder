json.array!(@charges) do |charge|
  json.extract! charge, :id, :title, :user_id
  json.url charge_url(charge, format: :json)
end
