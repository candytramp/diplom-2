json.array!(@sources) do |source|
  json.extract! source, :id, :funding_source
  json.url source_url(source, format: :json)
end
