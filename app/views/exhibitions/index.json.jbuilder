json.array!(@exhibitions) do |exhibition|
  json.extract! exhibition, :id, :name, :etype, :country, :city, :start, :finish, :year, :creator_login, :creator_data
  json.url exhibition_url(exhibition, format: :json)
end
