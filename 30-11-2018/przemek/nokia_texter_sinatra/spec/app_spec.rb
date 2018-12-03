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

  it 'checks if view is returned' do
    get '/'
    expect(last_response.body).to match(/Nokia Texter/)
  end

  it 'return proper nokia texter text' do
    get '/?text=ale z cb super ziomek'
    expect(last_response.body).to match(/ALEzCBsuperZIOMEK/)
  end

  it 'return error for to long text' do
    get ('/?text=' + 'Z'*161)
    expect(last_response.body).to match(/Won't fit into single sms/)
  end
end