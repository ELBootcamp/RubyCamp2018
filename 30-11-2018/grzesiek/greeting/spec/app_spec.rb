require 'spec_helper'
require './lib/app'
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
end