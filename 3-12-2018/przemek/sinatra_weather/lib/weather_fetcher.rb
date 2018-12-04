require 'http'

module WeatherFetcher
  module_function

  HOST = "http://dataservice.accuweather.com"
  API_KEY = "8iGFfGHFtGsNzZTCyfwe1BoK9JLGlFwf"

  def get_location_key(city_name)
    (raise ArgumentError) unless city_name

    response = HTTP.get("#{HOST}/locations/v1/cities/PL/search?apikey=#{API_KEY}&q=#{city_name}")
    parsed_response = JSON.parse(response.body)
    parsed_response[0]['Key'] if parsed_response[0]
  end

  def get_5day_forecast(city_key)
    (raise ArgumentError) unless city_key

    response = HTTP.get("#{HOST}/forecasts/v1/daily/5day/#{city_key}?apikey=#{API_KEY}&details=true&metric=true")
    parsed_response = JSON.parse(response.body)
    
    (raise UnknownError) unless parsed_response['DailyForecasts']

    weather_data = []
    parsed_response['DailyForecasts'].each do |day|
      weather_data << {
        'Min_temperature' => day['Temperature']['Minimum']['Value'],
        'Max_temperature' => day['Temperature']['Maximum']['Value'],
        'Rain_fall' => day['Day']['Rain']['Value']
      }
    end
    weather_data
  end
end

class UnknownError < StandardError; end