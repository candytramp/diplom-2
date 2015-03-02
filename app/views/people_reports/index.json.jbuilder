json.array!(@people_reports) do |people_report|
  json.extract! people_report, :id, :report_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details
  json.url people_report_url(people_report, format: :json)
end
