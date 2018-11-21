require 'spec_helper'
require_relative '../positive_calculator'

RSpec.describe PositiveCalculator do

  describe '#add' do
    context 'error rising' do
      it 'raises an error when there is not enough arguments' do
        expect {subject.add'1\n'}.to raise_error(NotEnoughNumbers) 
      end
      it 'raises an error when the result is lower than 0' do
        expect {subject.add('-2,1')}.to raise_error(NegativesNotAllowed)
      end
    end
    context 'returning computation result' do
      it 'handles numbers are separated by comma' do
        expect(subject.add('1,5,5,4,6')).to eq(21)
      end
      it 'handles numbers separated by new line' do
        expect(subject.add('1\n2\n3')).to eq(6)
      end
      it 'handles delimiters defined after // substring' do
        expect(subject.add('//;\n1;2')).to eq(3)
      end
    end
    context 'arguments sanitizing' do
      it 'replaces argument with 0 when is bigger than 1000' do
        expect(subject.add('1,1001')).to eq(1)
      end
      it 'handles when there is string is empty' do
        expect(subject.add('')).to eq(0)
      end
    end
  end

  describe '#subtract' do
    context 'error rising' do
      it 'raises an error when there is not enough arguments' do
        expect {subject.subtract('1\n')}.to raise_error(NotEnoughNumbers) 
      end
      it 'raises an error when there is any negative number' do
        expect {subject.subtract('-2,1')}.to raise_error(NegativesNotAllowed)
      end
      it 'raises an error when the result is lower than 0' do
        expect {subject.subtract('1,2')}.to raise_error(NegativesNotAllowed)
      end
    end
    context 'returning computation result' do
      it 'handles numbers are separated by comma' do
        expect(subject.subtract('10,4')).to eq(6)
      end
      it 'handles delimiters defined after // substring' do
        expect(subject.subtract('//;\n2;1')).to eq(1)
      end
      it 'handles numbers separated by new line' do
        expect(subject.subtract('3\n1\n1')).to eq(1)
      end
    end
    context 'arguments sanitizing' do
      it 'replaces argument with 0 when is bigger than 1000' do
        expect(subject.subtract('1,1001')).to eq(1)
      end
    end
  end

end
