require 'sinatra'
require "sinatra/reloader" if development?
require_relative 'lib/weather_fetcher'

get '/' do
  @weather_data = []
  if params[:city_name]
    begin
      city_key = WeatherFetcher.get_location_key(params[:city_name])
      @weather_data = WeatherFetcher.get_5day_forecast(city_key)
    rescue ArgumentError
      @error_msg = 'Uncorrect city name was given!'
      @weather_data = []
    rescue UnknownError
      @error_msg = "Unknow API error"
      @weather_data = []
    end
  end
  erb :index
end
