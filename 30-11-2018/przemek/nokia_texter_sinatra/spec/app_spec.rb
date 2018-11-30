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
end