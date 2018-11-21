require 'spec_helper'
require_relative '../lib/string_utils'

RSpec.describe 'StringUtils' do
  context 'making CamelCase string expression underscored, lowercase form'
    it 'changes Capital letters to lower one and adds underscore' do
      expect(StringUtils.underscore('ActiveModelString')).to eq("active_model_string")
    end

    it 'changes Capital letters to lower one and adds underscore - another case' do
      expect(StringUtils.underscore('IBelieveInIt')).to eq("i_believe_in_it")
    end
  end

  context 'raising error' do
    it 'raises error when string is null' do
      expect { String.underscore(null) }.to raise_error(ArgumentError)
    end

    it 'prints statemets when string is empty' do
      expect { String.underscore("") }.to raise_error("Empty string")
    end
  end
end