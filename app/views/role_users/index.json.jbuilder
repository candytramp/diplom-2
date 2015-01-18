json.array!(@role_users) do |role_user|
  json.extract! role_user, :id, :user_id, :role_id, :value
  json.url role_user_url(role_user, format: :json)
end
