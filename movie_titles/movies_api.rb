require 'json'

module MoviesApi
  def get_movies_api_data(url, page = nil)
    url = url << "&page=#{page}" if page
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def get_titles_from_response(response)
    movies = response['data']
    movies.map { |movie| movie['Title'] }
  end
end
