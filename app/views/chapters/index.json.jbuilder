json.array!(@chapters) do |chapter|
  json.extract! chapter, :id, :chapter_name, :chapter_type, :chapter_president_id
  json.url chapter_url(chapter, format: :json)
end
