require 'sinatra'
require "sinatra/reloader" if development?
require_relative 'lib/weather_fetcher'
require 'uri'

get '/' do
  if params[:city_name]
    begin
      city_key = WeatherFetcher.get_location_key(params[:city_name])
      @weather_data = WeatherFetcher.get_5day_forecast(city_key)
      @city_name = URI.decode(params[:city_name])
    rescue ArgumentError
      @error_msg = 'Uncorrect city name was given!'
    rescue UnknownError
      @error_msg = "Unknow API error"
    end
  end
  erb :index
end
