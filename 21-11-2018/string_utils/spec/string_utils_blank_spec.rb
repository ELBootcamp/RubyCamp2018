require 'spec_helper'
require_relative '../lib/string_utils'

RSpec.describe StringUtils do
  describe '#blank?' do
    context 'checking whether given text is blank' do
      it 'returns false when white spaces surrounds the string' do
        expect(subject.blank?(' a ')).to be false
      end

      it 'returns true when the string is empty' do
        expect(subject.blank?('')).to be true
      end

      it 'returns true when the string contains only only whitespace' do
        expect(subject.blank?("   \t  \n ")).to be true
      end
    end

    context 'raising error' do
      it 'raises error when string is nil' do
        expect { subject.underscore(nil) }.to raise_error(ArgumentError)
      end
    end
  end
end