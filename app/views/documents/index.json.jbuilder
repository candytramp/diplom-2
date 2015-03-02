json.array!(@documents) do |document|
  json.extract! document, :id, :description, :owner_id, :owner_type, :creator_login, :creator_data
  json.url document_url(document, format: :json)
end
