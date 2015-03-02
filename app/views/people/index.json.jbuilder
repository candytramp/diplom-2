json.array!(@people) do |person|
  json.extract! person, :id, :first_name, :last_name, :second_name, :external_ids, :birthday
  json.url person_url(person, format: :json)
end
