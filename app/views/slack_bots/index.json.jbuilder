json.array!(@slack_bots) do |slack_bot|
  json.extract! slack_bot, :id, :token
  json.url slack_bot_url(slack_bot, format: :json)
end
