json.array!(@ois_requests) do |ois_request|
  json.extract! ois_request, :id, :number, :priority, :author, :name, :object, :reg_agency, :research_effort_id, :status, :creator_login, :creator_data
  json.url ois_request_url(ois_request, format: :json)
end
