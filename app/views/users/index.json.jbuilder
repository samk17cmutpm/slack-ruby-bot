json.array!(@users) do |user|
  json.extract! user, :id, :id_slack, :is_admin
  json.url user_url(user, format: :json)
end
