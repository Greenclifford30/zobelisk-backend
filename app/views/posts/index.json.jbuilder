json.array!(@posts) do |post|
  json.extract! post, :id, :email, :timestamp, :likes, :title, :event_date, :body_text, :media
  json.url post_url(post, format: :json)
end
