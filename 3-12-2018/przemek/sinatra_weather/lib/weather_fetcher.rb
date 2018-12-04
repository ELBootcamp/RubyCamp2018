require 'http'

module WeatherFetcher
  module_function

  HOST = "http://dataservice.accuweather.com"
  API_KEY = "BxGKx35AfPB4AWQotmgLqZGgMZyGgOx5"

  def get_location_key(city_name)
    response = HTTP.get("#{HOST}/locations/v1/cities/PL/search?apikey=#{API_KEY}&q=#{city_name}")
    parsed_response = JSON.parse(response.body)
    parsed_response[0]['Key']
  end

  def get_5day_forecast(city_key)
    response = HTTP.get("#{HOST}/forecasts/v1/daily/5day/#{city_key}?apikey=#{API_KEY}&details=true&metric=true")
    parsed_response = JSON.parse(response.body)
    
    daily_forecasts = parsed_response['DailyForecasts']
    daily_forecasts
  end
end