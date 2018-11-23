require 'spec_helper'
require_relative '../lib/string_utils'

RSpec.describe StringUtils do
  describe '#remove' do 
    it 'returns string with removed all occurrences of second string parameter' do
      expect(subject.remove('foo bar test', ' test')).to eq('foo bar')
    end

    it 'returns string with removed all occurrences of provided string patterns' do
      expect(subject.remove('foo bar test', ' test', 'bar')).to eq('foo ')
    end

    it 'checks if str argument was not modified' do
      str = 'foo bar test'
      subject.remove(str, ' test')
      expect(str).to eq('foo bar test')
    end

    it 'raises an error when input is not a string' do
      expect { subject.remove(12345, ' test', 'bar') }
      .to raise_error(ArgumentError)
    end

    it 'returns string when pattern is not included in string' do
      expect(subject.remove('foo bar', 'foobar')).to eq('foo bar')
    end

    it 'returns string when one of patterns is regexp type' do
      expect(subject.remove('foo bar test', ' test', /bar/)).to eq('foo ')
    end

    it 'raises ArgumentError if one of the patterns is invalid' do
      expect { subject.remove('foo bar test', ' test', 232) }
      .to raise_error(ArgumentError)
    end
  end
end