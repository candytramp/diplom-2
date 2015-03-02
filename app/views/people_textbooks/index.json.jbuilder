json.array!(@people_textbooks) do |people_textbook|
  json.extract! people_textbook, :id, :textbook_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details
  json.url people_textbook_url(people_textbook, format: :json)
end
