json.array!(@monographs) do |monograph|
  json.extract! monograph, :id, :isbn, :name, :publisher, :publisher_name, :publish_year, :pages
  json.url monograph_url(monograph, format: :json)
end
