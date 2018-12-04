require 'sinatra'
require './lib/weather_fetcher'

get '/' do
  if params[:location]
    sanitized_location = WeatherFetcher.sanitize_location(params[:location])
    location_key = WeatherFetcher.get_location_key(sanitized_location)
    @location = params[:location].capitalize
    @data = WeatherFetcher.get_weather_data(location_key)
  end
  
  erb :weather
end