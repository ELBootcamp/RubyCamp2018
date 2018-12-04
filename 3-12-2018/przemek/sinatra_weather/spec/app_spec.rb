require 'spec_helper'
require './app'
require 'rack/test'

RSpec.describe 'Sinatra application' do
  include Rack::Test::Methods

  let(:five_day_forecast) do
    [ 
      {
        'Min_temperature' => 5,
        'Max_temperature' => 10,
        'Rain_fall' => 6
      }
    ]
  end

  let(:city_key) do
    '274663'
  end

  def app
    Sinatra::Application
  end

  it 'should allow accessing the home page' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'should display weather correcly' do 
    allow(WeatherFetcher).to receive(:get_location_key).and_return(city_key)
    allow(WeatherFetcher).to receive(:get_5day_forecast).and_return(five_day_forecast)

    get '/?city_name=warsaw'
    expect(last_response.body).to include('Min temperature: 5')
  end
end
