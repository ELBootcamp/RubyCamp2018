require 'http'

module WeatherFetcher
  module_function

  def get_location_key(location)
    response = HTTP.get("http://dataservice.accuweather.com/locations/v1/cities/search?apikey=ZsUQlr6IiR08KhJiLoftMi0E8N8mYteX&q=#{location}&language=pl-pl&details=true")
    parsed_response = JSON.parse(response.body)

    location_key = parsed_response[0]["Key"]
  end

  def get_weather_data(location_key)
    response = HTTP.get("http://dataservice.accuweather.com/forecasts/v1/daily/1day/#{location_key}?apikey=ZsUQlr6IiR08KhJiLoftMi0E8N8mYteX&language=pl-pl&details=true&metric=true")
    parsed_response = JSON.parse(response.body)

    weather_data = parsed_response["DailyForecasts"][0]

    
  end

  def get_min_temperature(weather_data)
    min_temperature = weather_data["Temperature"]["Minimum"]["Value"]
  end

  def get_max_temperature(weather_data)
    max_temperature = weather_data["Temperature"]["Maximum"]["Value"]
  end

  def get_rain_info(weather_data)
    rain_info = weather_data["Day"]["Rain"]["Value"]
  end
end