json.array!(@diploma_people) do |diploma_person|
  json.extract! diploma_person, :id, :diploma_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details
  json.url diploma_person_url(diploma_person, format: :json)
end
