require 'sinatra'
require './lib/weather_fetcher'
require 'byebug'

get '/' do
  begin
    if params[:location]
      location_key = WeatherFetcher.get_location_key(params[:location])
      @location = params[:location].capitalize
      @data = WeatherFetcher.get_weather_data(location_key)
    end
    if params[:to_csv]
      WeatherFetcher.convert_to_csv(@data)
    end
  rescue ArgumentError
    @unknown = 'Unknown city. Please insert location once again.'
  end
  
  erb :weather
end