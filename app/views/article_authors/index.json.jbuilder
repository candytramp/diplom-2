json.array!(@article_authors) do |article_author|
  json.extract! article_author, :id, :article_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details
  json.url article_author_url(article_author, format: :json)
end
