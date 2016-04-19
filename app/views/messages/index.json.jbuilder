json.array!(@messages) do |message|
  json.extract! message, :id, :message
  json.url message_url(message, format: :json)
end
