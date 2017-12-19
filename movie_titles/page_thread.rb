require_relative 'movies_api'

class PageThread < Thread
  include MoviesApi

  def initialize(url, index)
    @url = url
    @index = index
    super
  end

  def get_titles
    get_titles_from_response(response)
  end

  private

  def response
    data = get_movies_api_data(@url, @index)
    puts "Page #{@index}: "
    ap data.reject { |k, v| ['data'].include? k }
    data
  end
end
