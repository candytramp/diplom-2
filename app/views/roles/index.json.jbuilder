json.array!(@roles) do |role|
  json.extract! role, :id, :name, :info
  json.url role_url(role, format: :json)
end
