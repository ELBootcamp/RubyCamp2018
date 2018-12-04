require 'http'
require 'byebug'

module GifFetcher
  module_function

  def gif_url(category)
    response = HTTP.get("http://api.giphy.com/v1/gifs/search?q=#{category}&api_key=dc6zaTOxFJmzC")
    parsed_response = JSON.parse(response.body)

    parsed_response['data'][0]['images']['fixed_height']['url']
  end
end
