json.array!(@state_programs) do |state_program|
  json.extract! state_program, :id, :name
  json.url state_program_url(state_program, format: :json)
end
