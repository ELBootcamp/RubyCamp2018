require 'spec_helper'
require_relative '../lib/string_utils'

RSpec.describe StringUtils do
  describe '#normalize_punctuation' do

    context 'when passed string' do
      it 'return output with fixed punctuation problems' do
        expect(subject.normalize_punctuation(',,,  ')).to eq(', ')
        expect(subject.normalize_punctuation('a  ,  b')).to eq('a, b')
        expect(subject.normalize_punctuation(' , a,,b ,')).to eq('a, b')
        expect(subject.normalize_punctuation(', developers ,, problem ,,')).to eq('developers, problem')
      end

      it 'return valid output for string containing other than a-z characters' do
        expect(subject.normalize_punctuation(', 1abc, ss;s ,')).to eq('1abc, ss;s')
      end
    end

    context 'when passed object of different type than string' do
      it 'will return nil' do
        expect(subject.normalize_punctuation(1)).to eq(nil)
      end
    end
  end
end