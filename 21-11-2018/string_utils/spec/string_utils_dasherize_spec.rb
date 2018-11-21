require 'spec_helper'
require_relative '../lib/string_utils'

RSpec.describe StringUtils do
  describe '#dasherize' do
    context 'replacing undescores with dashes in the string' do
      it 'replaces underscores with dashes' do
        expect(subject.dasherize('puni_puni')).to eq('puni-puni')
        expect(subject.dasherize('_abc_def_')).to eq('-abc-def-')
      end
    end

    context 'raising error' do
      it 'raises error when string is nil' do
        expect { subject.underscore(nil) }.to raise_error(ArgumentError)
      end

      it 'raises error when string is nil' do
        expect { subject.underscore(nil) }.to raise_error("String doesn't contain any dashes.")
      end
    end
  end
end