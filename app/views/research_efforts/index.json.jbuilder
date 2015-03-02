json.array!(@research_efforts) do |research_effort|
  json.extract! research_effort, :id, :name, :state_program_id, :start_date, :finish_date, :grnti_id, :field_id, :full_value, :year_value, :state_reg_number, :nir_number, :inventory_number, :nir_type_id, :source_id, :scientific_school_id, :is_nir, :creator_login, :creator_data
  json.url research_effort_url(research_effort, format: :json)
end
