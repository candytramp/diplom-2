json.array!(@grntis) do |grnti|
  json.extract! grnti, :id, :name, :grnti
  json.url grnti_url(grnti, format: :json)
end
