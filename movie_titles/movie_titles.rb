#!/bin/ruby

require 'net/http'
require 'json'
require 'ap'
require_relative 'page_thread'
require_relative 'movies_api'

API_ENDPOINT = 'https://jsonmock.hackerrank.com/api/movies/search/?Title='.freeze

class MovieTitles
  include MoviesApi

  def initialize(substr)
    @substr = substr
  end

  def get_titles
    # to_s handles `nil` gracefully
    return [] if @substr.to_s.strip.empty?

    initial_response = get_initial_data
    puts "Page 1: "
    ap initial_response.reject { |k, v| ['data'].include? k }
    return [] if initial_response['total'] == 0

    output = get_titles_from_response(initial_response)
    return output unless initial_response['total_pages'] > 1
    (output << get_additional_pages(initial_response)).flatten.sort
  end

  private

  def get_initial_data
    request_url = API_ENDPOINT.dup << @substr
    get_movies_api_data(request_url)
  end

  def get_additional_pages(response)
    collected_titles = []
    page_index = 1
    page_count = response['total_pages']
    request_url = API_ENDPOINT.dup << @substr

    threads = []

    while page_index < page_count
      page_index += 1
      threads << PageThread.new(request_url, page_index) {
        PageThread.current.get_titles
      }
    end

    threads.map { |t| t.value }
  end
end

def getMovieTitles(substr)
  movie_titles = MovieTitles.new(substr)
  movie_titles.get_titles
end

### for local testing, do not paste after this line into hackerrank
puts 'enter a query string: '
_substr = gets.to_s.strip;

res = getMovieTitles(_substr);
puts 'Output: '
ap res
