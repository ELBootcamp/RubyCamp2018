ENV['RACK_ENV'] = 'test'

require 'spec_helper'
require './app'
require 'rack/test'

RSpec.describe 'Sinatra application' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'should allow accessing the home page' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'return proper greeting' do
    get '/?name=Ania'
    expect(last_response.body).to match(/No siema, Ania!/)
  end

  it 'returns error message for Janek name' do
    get '/?name=Janek'
    expect(last_response.body).to match(/Invalid name, dude!/)
  end

  it 'returns error message when name is blank' do
    get '/?name='
    expect(last_response.body).to match(/Name can't be blank./)
  end
end
