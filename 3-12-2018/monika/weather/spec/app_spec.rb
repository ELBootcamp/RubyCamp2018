ENV['RACK_ENV'] = 'test'

require 'spec_helper'
require './app'
require 'rack/test'

RSpec.describe 'Weather application' do
  include Rack::Test::Methods

  before do
  	allow(WeatherForecast.new('Warsaw')).to receive(:max_temperature).and_return('7.3')
  end

  def app
    Sinatra::Application
  end

  it 'should allow accessing the home page' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'should present maximum temperature for given location' do  
    get '/?location=Warsaw'
    allow(WeatherForecast.new('Warsaw')).to receive(:max_temperature).and_return('7.3')
    expect(last_response.body).to include('7.3')
  end

  it 'should present minimum temperature for given location' do  
    get '/?location=Warsaw'
    allow(WeatherForecast.new('Warsaw')).to receive(:min_temperature).and_return('-1.7')
    expect(last_response.body).to include('-1.7')
  end

  it 'should present rain for given location' do  
    get '/?location=Warsaw'
    allow(WeatherForecast.new('Warsaw')).to receive(:rain).and_return('6.0')
    expect(last_response.body).to include('6.0')
  end


end

