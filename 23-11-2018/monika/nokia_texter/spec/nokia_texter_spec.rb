require 'spec_helper'
require_relative '../lib/nokia_texter'
RSpec.describe NokiaTexter do
  describe '#squeeze' do
    it 'squeezes text' do
      expect(NokiaTexter.new('').squeeze).to eq('')
      expect(NokiaTexter.new('zaraz wracam').squeeze).to eq('ZARAZwracam')
      expect(NokiaTexter.new('Nie czekaj z kolacja').squeeze).to eq('NIEczekajZkolacja')
      expect(NokiaTexter.new('ZrobZakupyIWyrzucSmieci').squeeze).to eq('ZrobZakupyIWyrzucSmieci')
      expect(NokiaTexter.new("Zrob \n ZakupyIWyrzuc \t Smieci").squeeze).to eq('ZrobZakupyIWyrzucSmieci')
    end
    it 'raises error when text is too long' do
      expect { NokiaTexter.new('Nie czekaj z kolacja.' * 10).squeeze }
        .to raise_error(MessageTooLong)
    end
    it 'raises error when input is not string' do
      expect { NokiaTexter.new(123).squeeze }
        .to raise_error(ArgumentError)
    end
  end
end
