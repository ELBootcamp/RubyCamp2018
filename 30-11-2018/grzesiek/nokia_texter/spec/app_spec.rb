require 'spec_helper'
require './app'
require 'rack/test'

RSpec.describe 'Sinatra Transform Text App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'should allow accessing the home page' do
    get '/'

    expect(last_response).to be_ok
  end

  it 'returns squeezed text' do
    get '/?text=zaraz wracam'
    expect(last_response.body).to match(/ZARAZwracam/)
    get '/?text=Nie czekaj z kolacja.'
    expect(last_response.body).to match(/NIEczekajZkolacja./)
  end

  it 'returns original text when it does not include any spaces' do
    get '/?text=ZrobZakupyWyrzucSmieci'
    expect(last_response.body).to match(/ZrobZakupyWyrzucSmieci/)
  end

  it 'raises MessageTooLong error when squeezed text length is longer than 160 chars' do
    get '/?text=Nie czekaj z kolacja. Jutro tez. I pojutrze. W ogole to wroce za tydzien. Chyba, ze zmienie zdanie. Z reszta, niewazne. Pa. Nie czekaj z kolacja. Jutro tez. I pojutrze. W ogole to wroce za tydzien.'
    expect(last_response.body).to match(/Message too long. Message needs to be shorter than 160 characters/)
  end

end
