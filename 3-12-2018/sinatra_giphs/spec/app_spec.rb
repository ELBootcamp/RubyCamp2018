ENV['RACK_ENV'] = 'test'

require 'spec_helper'
require './app'
require 'rack/test'

RSpec.describe 'Sinatra application' do
  include Rack::Test::Methods

  let(:gif_url) do
    'https://media3.giphy.com/media/kLLvH1EOtCwQ8/200.gif?cid=e1bb72ff5c04ed785a4e505751536ee8'
  end

  def app
    Sinatra::Application
  end

  it 'should allow accessing the home page' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'should allow accessing the home page' do
    allow(GifFetcher).to receive(:gif_url).and_return(gif_url)

    get '/?params=animal'
    expect(last_response.body).to include(gif_url)
  end
end
