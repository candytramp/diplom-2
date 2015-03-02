json.array!(@theses) do |thesis|
  json.extract! thesis, :id, :person_id, :speciality, :council, :theme, :ttype, :year, :in_time, :defence_date, :council_code
  json.url thesis_url(thesis, format: :json)
end
