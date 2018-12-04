require 'http'

module WeatherFetcher
  module_function

  HOST = "http://dataservice.accuweather.com"
  API_KEY = "UVGsfCyAHjWjgwCxlDDt7jHRafVOAXEi"

  def get_location_key(city_name)
    (raise ArgumentError) unless city_name

    city_name = sanitize_polish_characters(city_name.tr(' ', '-'))

    response = HTTP.get("#{HOST}/locations/v1/cities/PL/search?apikey=#{API_KEY}&q=#{city_name}")
    parsed_response = JSON.parse(response.body)

    parsed_response[0]['Key'] if parsed_response[0]
  end

  def get_5day_forecast(city_key)
    (raise ArgumentError) unless city_key

    response = HTTP.get("#{HOST}/forecasts/v1/daily/5day/#{city_key}?apikey=#{API_KEY}&language=pl-pl&details=true&metric=true")
    parsed_response = JSON.parse(response.body)
    
    (raise UnknownError) unless parsed_response['DailyForecasts']

    parsed_response['DailyForecasts'].map do |day|
      {
        'Min_temperature' => day['Temperature']['Minimum']['Value'],
        'Max_temperature' => day['Temperature']['Maximum']['Value'],
        'Rain_fall' => day['Day']['Rain']['Value']
      }
    end
  end

  def sanitize_polish_characters(str)
    str.tr('ąćęłńóśźż', 'acelnoszz')
  end  
end

class UnknownError < StandardError; end