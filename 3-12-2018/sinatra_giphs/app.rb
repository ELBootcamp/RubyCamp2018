require 'sinatra'
require_relative 'lib/gif_fetcher'

get '/' do
  @gif_url = GifFetcher.gif_url(params[:gif_category])

  erb :gifs
end
