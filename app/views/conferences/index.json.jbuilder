json.array!(@conferences) do |conference|
  json.extract! conference, :id, :name, :country, :city, :start, :finish, :year, :ctype, :creator_login, :creator_data
  json.url conference_url(conference, format: :json)
end
