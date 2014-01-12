json.array!(@favorites) do |favorite|
  json.extract! favorite, :id, :username
  json.url favorite_url(conference, format: :json)
end
