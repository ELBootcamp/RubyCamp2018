require 'sinatra'
require './lib/weather_fetcher'

get '/' do
  if params[:location]
    location_key = WeatherFetcher.get_location_key(params[:location])
    @location = params[:location].capitalize
    @weather_data = WeatherFetcher.get_weather_data(location_key)
    # @min_temperature = WeatherFetcher.get_min_temperature(weather_data)
    # @max_temperature = WeatherFetcher.get_max_temperature(weather_data)
    # @rain = WeatherFetcher.get_rain_info(weather_data)
  end
  
  erb :weather
end