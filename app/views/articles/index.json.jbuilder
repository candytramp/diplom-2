json.array!(@articles) do |article|
  json.extract! article, :id, :name, :source, :start_page, :finish_page, :link, :year, :creator_login, :creator_data
  json.url article_url(article, format: :json)
end
