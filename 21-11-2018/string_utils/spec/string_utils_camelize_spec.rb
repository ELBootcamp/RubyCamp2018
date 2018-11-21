require 'spec_helper'
require_relative '../lib/string_utils'

RSpec.describe StringUtils do
  describe '#camelize' do
    context 'when invoked method without second parameter' do
      it 'returns string in camel case, for valid input' do
        expect(subject.camelize('active_model')).to eq('ActiveModel')
        expect(subject.camelize('active_model base')).to eq('ActiveModelBase')
      end

      it 'returns nil, for inputs other than string' do
        expect(subject.camelize(2)).to eq(nil)
        expect(subject.camelize(nil)).to eq(nil)
      end
    end

    context 'when invoked with second parameter set to :lower' do
      it 'returns string in lower camel case, for valid input' do
        expect(subject.camelize('active_model', :lower)).to eq('activeModel')
        expect(subject.camelize('active_model base', :lower)).to eq('activeModelBase')
      end

      it 'returns nil, for inputs other than string' do
        expect(subject.camelize(2, :lower)).to eq(nil)
        expect(subject.camelize(nil, :lower)).to eq(nil)
      end
    end

    context 'when invoked with second parameter not set to :lower' do
      it 'will omit second parameter' do
        expect(subject.camelize('active_model', :not_lower)).to eq('ActiveModel')
      end
    end
  end
end