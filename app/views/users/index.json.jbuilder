json.array!(@users) do |user|
  json.extract! user, :id, :login, :info, :data
  json.url user_url(user, format: :json)
end
