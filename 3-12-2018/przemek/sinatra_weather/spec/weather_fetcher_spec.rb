require 'spec_helper'
require './lib/weather_fetcher'

RSpec.describe WeatherFetcher do

  it 'returns proper location key' do
    expect(subject.get_location_key('warsaw')).to eq('274663')
  end

  it 'returns 5day forecast for location key' do
    expect(subject.get_5day_forecast('274663').size).to eq(5)
  end
end
