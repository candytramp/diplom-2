json.array!(@exhibit_people) do |exhibit_person|
  json.extract! exhibit_person, :id, :exhibit_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details
  json.url exhibit_person_url(exhibit_person, format: :json)
end
