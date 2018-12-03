require 'spec_helper'
require_relative '../lib/nokia_texter'

RSpec.describe NokiaTexter do
  describe '#squeeze' do
    it 'returns squeezed text' do
      expect(NokiaTexter.new('zaraz wracam').squeeze).to eq('ZARAZwracam')
      expect(NokiaTexter.new('Nie czekaj z kolacja.').squeeze)
      .to eq('NIEczekajZkolacja.')
    end

    it 'returns original text when it does not include any spaces' do
      expect(NokiaTexter.new('ZrobZakupyWyrzucSmieci').squeeze).to eq('ZrobZakupyWyrzucSmieci') 
    end

    it "returns troll text when 'Frank Sinatra' is provided" do
      expect(NokiaTexter.new('Frank Sinatra').squeeze).to eq('BardzoQwaŚmieszne') 
    end

    it 'handles ASCII and UNICODE whitespaces' do
      expect(NokiaTexter.new("zaraz\n wracam").squeeze).to eq('ZARAZwracam')
    end

    it 'raises MessageTooLong error when squeezed text length is longer than 160 chars' do
      expect { NokiaTexter.new("Nie czekaj z kolacja. Jutro też. I pojutrze. \
        W ogóle to wrócę za tydzień. Chyba, że zmienię zdanie. Z resztą, nieważne. Pa." *2).squeeze }
        .to raise_error(MessageTooLong)
    end

    it 'returns empty string when if empty string is provided' do
      expect(NokiaTexter.new('').squeeze).to eq('') 
    end

    it 'returns ArgumentError when Numeric is provided' do
      expect { NokiaTexter.new(123456).squeeze }.to raise_error(ArgumentError)
      expect { NokiaTexter.new(12.3456).squeeze }.to raise_error(ArgumentError)
    end
  end
end