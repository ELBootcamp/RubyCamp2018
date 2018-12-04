require 'http'
require 'byebug'
require 'csv'

class WeatherForecast
  KEY = "sMKVk9lTLY7N9uRMBf3hQ9Ys9ePGlLsB".freeze

  def initialize(location)
    city_location = HTTP.get("http://dataservice.accuweather.com/locations/v1/PL/search?apikey=#{KEY}&q=#{location}")
    raise ApiError unless city_location.code == 200  
        p JSON.parse(city_location.body)[0]
    #raise NoCityFoundError unless JSON.parse(city_location.body)[0]
    if JSON.parse(city_location.body)[0]
      parsed_city_location = JSON.parse(city_location.body)[0]['Key'] 
    else
      parsed_city_location = "274663"
    end
    response = HTTP.get("http://dataservice.accuweather.com/forecasts/v1/daily/5day/#{parsed_city_location}?apikey=#{KEY}&details=true&metric=true")
    @parsed_response = JSON.parse(response.body)

    raise ApiError unless response.code == 200 
    raise ApiError unless @parsed_response['DailyForecasts']
    @forecasts = []
    @min_temperatures = []
    @max_temperatures = []
    @rain = []

     @parsed_response['DailyForecasts'].each do |item|
      @forecasts.push(item['Date'][0..9])
      @min_temperatures.push(item['Temperature']['Minimum']['Value'])
      @max_temperatures.push(item['Temperature']['Maximum']['Value'])        
      @rain.push(item['Day']['Rain']['Value'])
    end
  end

  def get_forecast()
    @forecasts
  end

  def max_temperature()
    @max_temperatures
  end

  def min_temperature()
    @min_temperatures
  end

  def rain()
    @rain
  end

  def download()   
    csv_string = CSV.generate do |csv|
      @parsed_response['DailyForecasts'].each do |hash|
        csv << hash.values
      end
    end
    csv_string
  end
end
class ApiError < StandardError; end
class NoCityFoundError < StandardError; end;

p WeatherForecast.new('Warsaw').download
