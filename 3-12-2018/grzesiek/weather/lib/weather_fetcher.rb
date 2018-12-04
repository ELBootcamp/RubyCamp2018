require 'http'

module WeatherFetcher
  module_function

  API_KEY = 'SBnLFY4eHnAR3b2UqjfEqsTEEI4iaITe'

  def get_location_key(location)
    response = HTTP.get("http://dataservice.accuweather.com/locations/v1/cities/search?apikey=#{API_KEY}&q=#{location}&language=pl-pl&details=true")
    parsed_response = JSON.parse(response.body)

    location_key = parsed_response[0]["Key"]
  end

  def get_weather_data(location_key)
    response = HTTP.get("http://dataservice.accuweather.com/forecasts/v1/daily/1day/#{location_key}?apikey=#{API_KEY}&language=pl-pl&details=true&metric=true")
    parsed_response = JSON.parse(response.body)

    weather_data = parsed_response["DailyForecasts"][0]

    data = {
      'min_temperature' => weather_data["Temperature"]["Minimum"]["Value"],
      'max_temperature' => weather_data["Temperature"]["Maximum"]["Value"],
      'rain' => weather_data["Day"]["Rain"]["Value"]
    }
  end
end
