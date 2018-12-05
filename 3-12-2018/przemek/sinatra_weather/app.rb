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
      @error_msg = "Unknown API error"
    end
  end

  return erb :index unless params[:file] == 'true'
  # Chyba raczej kolejny route powinien byc?
  content_type 'application/csv'
  attachment "data_#{@city_name}.csv"
  WeatherFetcher.weather_data_csv_export(@weather_data)
end
