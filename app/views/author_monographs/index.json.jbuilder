json.array!(@author_monographs) do |author_monograph|
  json.extract! author_monograph, :id, :monograph_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details, :pages
  json.url author_monograph_url(author_monograph, format: :json)
end
