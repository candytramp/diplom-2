json.array!(@conference_people) do |conference_person|
  json.extract! conference_person, :id, :conference_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details
  json.url conference_person_url(conference_person, format: :json)
end
