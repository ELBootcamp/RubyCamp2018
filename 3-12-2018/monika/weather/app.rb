require 'sinatra'
require_relative 'lib/get_weather'

  get '/download' do 
    content_type 'application/csv'
    attachment "myfilename.csv"
    WeatherForecast.new(params[:location]).download   
  end
  get '/' do
    begin
  	  if params[:location]
  	  	weather = WeatherForecast.new(params[:location])
        @forecast = weather.get_forecast()
        @forecast=[] if @forecast.nil?
  	    @min_temp = weather.min_temperature()
  	    @max_temp = weather.max_temperature()
  	    @rain = weather.rain()
  	  end
    rescue ApiError
      @error_message = "Connection with API broken"
    rescue NoCityFoundError
      @error_message = "City not found"
    end
  	erb :weather
  end


