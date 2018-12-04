require 'spec_helper'
require './app'
require 'rack/test'

RSpec.describe 'Weather app' do
  include Rack::Test::Methods

  let(:forecast_url) do
    'http://dataservice.accuweather.com/forecasts/v1/daily/1day/274663?apikey=ZsUQlr6IiR08KhJiLoftMi0E8N8mYteX&details=true&metric=true'
  end

  def app
    Sinatra::Application
  end

  it 'should allow accessing the home page' do
    get '/'

    expect(last_response).to be_ok
  end

  # it 'should receive response from server' do
  #   allow(WeatherFetcher).to receive(:forecast_url).and_return(forecast_url)

  #   get '/?params=warsaw'
  #   expect(last_response.body).to include(forecast_url)
  # end

end
