json.array!(@oficer_ans) do |oficer_an|
  json.extract! oficer_an, :id, :text, :title, :deadline
  json.url oficer_an_url(oficer_an, format: :json)
end
