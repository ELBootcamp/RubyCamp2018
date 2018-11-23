require 'spec_helper'
require_relative '../lib/string_utils.rb'
  
RSpec.describe StringUtils do
  describe '#truncate' do         
      it 'truncates the string to given length' do
        expect(subject.truncate('Once upon a time in a world far far away'))
        .to eq('Once upon a time in a world...')
        expect(subject.truncate('Long, long, time ago, in galaxy so, so far away', 4))
        .to eq('Long...')
      end

      it 'adds three dots to empty string' do
        expect(subject.truncate('', 4)).to eq('')
      end

      it 'does not trucate string when 0 as parameter is given' do
        expect(subject.truncate('Long, long', 0)).to eq('Long, long')
      end

      it 'returns truncated text when lenght param is larger than string lenght' do
        expect(subject.truncate('Long, long', 99)).to eq('Long, long')
      end

      it 'returns truncated number converted to string' do
        expect(subject.truncate(12345689, 3)).to eq('123...')
        expect(subject.truncate(12345689.0, 3)).to eq('123...')
      end

      it 'raises an ArgumentError when input is not handled' do
        expect { subject.truncate([1,2,3], 2) }.to raise_error(ArgumentError)
        expect { subject.truncate({ some: 'thing' }, 2) }.to raise_error(ArgumentError)
      end
  end
end