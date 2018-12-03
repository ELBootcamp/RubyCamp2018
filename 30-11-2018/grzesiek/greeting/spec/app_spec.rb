require 'spec_helper'
require './app'
require 'rack/test'

RSpec.describe 'Sinatra greeting application' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'should allow accessing the home page' do
    get '/'

    expect(last_response).to be_ok
  end

  it 'return proper greeting' do 
    get '/?name=Greg'

    expect(last_response.body).to match(/No siema, Greg!/)
  end

  it 'returns error message when name is blank' do
    get '/?name='

    expect(last_response.body).to match(/Name can't be blank/)
  end

  it 'returns error message for Frank name' do
    get '/?name=Frank'

    expect(last_response.body).to match(/Very funny, dude!/)
  end
end