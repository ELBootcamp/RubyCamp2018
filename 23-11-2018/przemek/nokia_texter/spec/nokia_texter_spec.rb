require 'spec_helper'
require_relative '../lib/nokia_texter.rb'

RSpec.describe NokiaTexter do
  describe "#squeeze" do
    it 'returns valid output for valid input' do
      nokia_texter = NokiaTexter.new('zaraz wracam')
      expect(nokia_texter.squeeze).to eq('ZARAZwracam')

      nokia_texter = NokiaTexter.new('Nie czekaj z kolacja.')
      expect(nokia_texter.squeeze).to eq('NIEczekajZkolacja.')
    end

    it 'returns unchanged output if inputs string doesnt contain any spaces' do
      nokia_texter = NokiaTexter.new('ZrobZakupyIWyrzucSmieci')
      expect(nokia_texter.squeeze).to eq('ZrobZakupyIWyrzucSmieci')
    end

    it 'handles ASCII and UNICODE whitespaces' do
      nokia_texter = NokiaTexter.new("There\n are different \t whiTespaceS...")
      expect(nokia_texter.squeeze).to eq('THEREAreDifferentWhitespaces...')
    end

    it 'raises an ArgumentError if input not a string' do
      nokia_texter = NokiaTexter.new(12112112)
      expect { nokia_texter.squeeze }.to raise_error(ArgumentError)
    end

    it 'raises an MessageToLong error when input string is over 160 character long' do
      nokia_texter = NokiaTexter.new(('Z'*161))
      expect { nokia_texter.squeeze }.to raise_error(MethodToLong)
    end
  end
end