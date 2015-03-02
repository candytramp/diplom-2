json.array!(@exhibits) do |exhibit|
  json.extract! exhibit, :id, :name, :year, :exhibition_id
  json.url exhibit_url(exhibit, format: :json)
end
