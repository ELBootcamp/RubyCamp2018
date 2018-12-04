require 'sinatra'
require "sinatra/reloader" if development?
require_relative 'lib/weather_fetcher'

get '/' do
  city_key = WeatherFetcher.get_location_key(params[:city_name])
  @weather_data = WeatherFetcher.get_5day_forecast(city_key)
  erb :index
end
