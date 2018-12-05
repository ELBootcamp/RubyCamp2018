require 'spec_helper'
require './lib/weather_fetcher'

RSpec.describe WeatherFetcher do

  it 'returns proper location key' do
    expect(subject.get_location_key('warsaw')).to eq('274663')
  end

  it 'returns 5day forecast for location key' do
    expect(subject.get_5day_forecast('274663').size).to eq(5)
  end

  it 'returns proper location key for city names containing spaces' do
    expect(subject.get_location_key('nowa huta')).to eq('274456')
  end

  it 'raises ArgumentError if city name is invalid' do 
    expect { subject.get_location_key('Asa cczczcwrwr35353fs') }.to raise_error(ArgumentError)
  end

  it 'will generate proper csv file for given weather_data' do 
    weather_data = [
      {
        'Min_temperature' => 5,
        'Max_temperature' => 10,
        'Rain_fall' => 6
      }
    ]
    csv_string = "Min_temperature,Max_temperature,Rain_fall\n5,10,6\n"
    expect(subject.weather_data_csv_export(weather_data)).to eq(csv_string)
  end
end
