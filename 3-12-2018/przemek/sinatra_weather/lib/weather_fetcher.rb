require 'http'
require 'csv'

module WeatherFetcher
  module_function

  HOST = "http://dataservice.accuweather.com"
  API_KEY = "K2tjxrgt9AeB5lEFycbGtn5dxmHbj7rz"

  def get_location_key(city_name)
    (raise ArgumentError) unless city_name

    city_name = sanitize_polish_characters(city_name.tr(' ', '-'))

    response = HTTP.get("#{HOST}/locations/v1/cities/PL/search?apikey=#{API_KEY}&q=#{city_name}")
    parsed_response = JSON.parse(response.body)

    (raise UnknownError) unless response.code == 200
    (raise ArgumentError) unless parsed_response[0]

    parsed_response[0]['Key']
  end

  def get_5day_forecast(city_key)
    (raise ArgumentError) unless city_key

    response = HTTP.get("#{HOST}/forecasts/v1/daily/5day/#{city_key}?apikey=#{API_KEY}&language=pl-pl&details=true&metric=true")
    parsed_response = JSON.parse(response.body)

    (raise UnknownError) unless response.code == 200
    (raise UnknownError) unless parsed_response['DailyForecasts']

    parsed_response['DailyForecasts'].map do |day|
      {
        'Min_temperature' => day['Temperature']['Minimum']['Value'],
        'Max_temperature' => day['Temperature']['Maximum']['Value'],
        'Rain_fall' => day['Day']['Rain']['Value']
      }
    end
  end

  def weather_data_csv_export(weather_data)
    csv_string = CSV.generate do |csv|
      csv << weather_data[0].keys
      weather_data.each do |day|
        csv << day.values
      end
    end
  end

  def sanitize_polish_characters(str)
    str.tr('ąćęłńóśźż', 'acelnoszz')
  end  
end

class UnknownError < StandardError; end