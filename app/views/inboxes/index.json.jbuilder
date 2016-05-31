json.array!(@inboxes) do |inbox|
  json.extract! inbox, :id, :subject, :content, :user1_id, :user2_id
  json.url inbox_url(inbox, format: :json)
end
