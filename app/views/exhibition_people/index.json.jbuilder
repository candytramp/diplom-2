json.array!(@exhibition_people) do |exhibition_person|
  json.extract! exhibition_person, :id, :exhibition_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details
  json.url exhibition_person_url(exhibition_person, format: :json)
end
