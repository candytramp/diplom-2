json.array!(@reports) do |report|
  json.extract! report, :id, :title, :conference_id, :creator_login, :creator_data
  json.url report_url(report, format: :json)
end
