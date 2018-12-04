require 'spec_helper'
require './app'
require 'rack/test'
require 'byebug'

RSpec.describe 'Weather app' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  let(:weather_data) do
      {
      'min_temperature' => '-0.4',
      'max_temperature' => '8.7',
      'rain' => '4.0'
      }
  end

  it 'should allow accessing the home page' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'should receive location key from server' do
    allow(WeatherFetcher).to receive(:get_location_key).and_return('274663')

    get '/?location=warszawa'
    expect(last_response.body).to include('Warszawa')
  end

  it 'should receive weather data from server' do
    allow(WeatherFetcher).to receive(:get_weather_data).and_return(weather_data)

    get '/?location=warszawa'
    expect(last_response.body).to include('Minimum temperature: -0.4')
    expect(last_response.body).to include('Maximum temperature: 8.7')
    expect(last_response.body).to include('Rain: 4.0')
  end

  it 'raises ArgumentError when user sends empty string' do
    get '/?location='
    expect(last_response.body).to match(/Unknown city. Please insert location once again./)
  end

end
