# frozen_string_literal: true

class MovieService
  def self.movie_data(id)
    response = conn.get("/3/movie/#{id}?append_to_response=credits,reviews")
    get_json(response)
  end

  def self.find_movies(title, page)
    response = conn.get("/3/search/movie?&query=#{title}&page=#{page}")
    get_json(response)
  end

  def self.get_top_rated(page)
    response = conn.get("/3/movie/top_rated?&page=#{page}")
    get_json(response)
  end

  def self.conn
    Faraday.new('http://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end

  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
