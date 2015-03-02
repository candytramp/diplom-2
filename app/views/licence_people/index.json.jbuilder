json.array!(@licence_people) do |licence_person|
  json.extract! licence_person, :id, :licence_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details
  json.url licence_person_url(licence_person, format: :json)
end
