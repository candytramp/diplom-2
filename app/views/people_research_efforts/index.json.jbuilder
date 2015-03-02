json.array!(@people_research_efforts) do |people_research_effort|
  json.extract! people_research_effort, :id, :research_effort_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details, :person_value, :role
  json.url people_research_effort_url(people_research_effort, format: :json)
end
