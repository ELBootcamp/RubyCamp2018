require 'sinatra'
require_relative 'lib/get_weather'

get '/' do
  #@forecast = WeatherForecast.get_forecast(params[:location])
  if params[:location]
    @min_temp = WeatherForecast.min_temperature(params[:location])
    @max_temp = WeatherForecast.max_temperature(params[:location])
    @rain = WeatherForecast.rain(params[:location])
  end
  erb :weather
end
