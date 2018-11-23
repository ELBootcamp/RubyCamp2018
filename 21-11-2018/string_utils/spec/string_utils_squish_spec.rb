require 'spec_helper'
require_relative '../lib/string_utils'

RSpec.describe StringUtils do
  describe '#squish' do
    it 'removes all whitespaces on both ends of the string' do 
      expect(subject.squish(" some string   \t")).to eq('some string')
    end

    it 'removes all unnecessary whitespaces inside a string' do 
      expect(subject.squish(" some \t  string   \t")).to eq('some string')
    end

    it 'removes all unnecessary whitespaces inside a multi-line string' do
      expect(subject.squish(%{ Multi-line
              string })).to eq('Multi-line string') 
    end
  end
end