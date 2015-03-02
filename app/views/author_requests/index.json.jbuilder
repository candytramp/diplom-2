json.array!(@author_requests) do |author_request|
  json.extract! author_request, :id, :ois_request_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details
  json.url author_request_url(author_request, format: :json)
end
