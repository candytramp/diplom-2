json.array!(@licences) do |licence|
  json.extract! licence, :id, :number, :reg_date, :ltype, :name, :expiration_date, :req_number, :req_author, :req_object, :req_status, :reg_agency, :req_priority, :support, :research_effort_id, :creator_login, :creator_data
  json.url licence_url(licence, format: :json)
end
