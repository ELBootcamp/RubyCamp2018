require 'spec_helper'
require_relative '../lib/string_utils'

RSpec.describe StringUtils do
  describe '#underscore' do
    context 'making CamelCase string expression underscored, lowercase form' do
      it 'changes Capital letters to lower one and adds underscore' do
        expect(subject.underscore('ActiveModelString')).to eq("active_model_string")
        expect(subject.underscore('IBelieveInIt')).to eq("i_believe_in_it")
      end

      it 'handles case when there is a space in the string' do
        expect(subject.underscore('Active Model String')).to eq("active_model_string")
      end
    end

    context 'raising error' do
      it 'raises error when string is nil' do
        expect { subject.underscore(nil) }.to raise_error(ArgumentError)
      end

      it 'prints statemets when string is empty' do
        expect { subject.underscore("") }.to raise_error("Empty string")
      end
    end
  end
end