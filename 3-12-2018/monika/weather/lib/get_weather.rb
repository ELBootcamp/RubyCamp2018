require 'http'
require 'byebug'

module WeatherForecast
  module_function

  def get_forecast(location)
    # city_location = HTTP.get("http://dataservice.accuweather.com/locations/v1/PL/search?apikey=sNlIqVNUrUFHGk40lGgEM3RsrqXoVwRV&q=#{location}")
    # parsed_city_location = JSON.parse(city_location.body)[0]['Key']
    # response = HTTP.get("http://dataservice.accuweather.com/forecasts/v1/daily/1day/#{parsed_city_location}?apikey=sNlIqVNUrUFHGk40lGgEM3RsrqXoVwRV&details=true&metric=true")
    # parsed_response = JSON.parse(response.body)

    #parsed_response['DailyForecasts'][0]['Temperature']['Minimum']['Value']
   # parsed_response['DailyForecasts'][0]['Temperature']['Maximum']['Value']
    # parsed_response['DailyForecasts'][0]['Day']['Rain']['Value']
  end

  def max_temperature(location)
    city_location = HTTP.get("http://dataservice.accuweather.com/locations/v1/PL/search?apikey=sNlIqVNUrUFHGk40lGgEM3RsrqXoVwRV&q=#{location}")
    parsed_city_location = JSON.parse(city_location.body)[0]['Key']
    response = HTTP.get("http://dataservice.accuweather.com/forecasts/v1/daily/1day/#{parsed_city_location}?apikey=sNlIqVNUrUFHGk40lGgEM3RsrqXoVwRV&details=true&metric=true")
    parsed_response = JSON.parse(response.body)
    parsed_response['DailyForecasts'][0]['Temperature']['Maximum']['Value']
  end

  def min_temperature(location)
    city_location = HTTP.get("http://dataservice.accuweather.com/locations/v1/PL/search?apikey=sNlIqVNUrUFHGk40lGgEM3RsrqXoVwRV&q=#{location}")
    byebug
    parsed_city_location = JSON.parse(city_location.body)[0]['Key']

    response = HTTP.get("http://dataservice.accuweather.com/forecasts/v1/daily/1day/#{parsed_city_location}?apikey=sNlIqVNUrUFHGk40lGgEM3RsrqXoVwRV&details=true&metric=true")
    parsed_response = JSON.parse(response.body)
    parsed_response['DailyForecasts'][0]['Temperature']['Minimum']['Value']
  end

  def rain(location)
    city_location = HTTP.get("http://dataservice.accuweather.com/locations/v1/PL/search?apikey=sNlIqVNUrUFHGk40lGgEM3RsrqXoVwRV&q=#{location}")
    parsed_city_location = JSON.parse(city_location.body)[0]['Key']
    response = HTTP.get("http://dataservice.accuweather.com/forecasts/v1/daily/1day/#{parsed_city_location}?apikey=sNlIqVNUrUFHGk40lGgEM3RsrqXoVwRV&details=true&metric=true")
    parsed_response = JSON.parse(response.body)
    parsed_response['DailyForecasts'][0]['Day']['Rain']['Value']
  end
end

WeatherForecast.get_forecast('Warsaw')
