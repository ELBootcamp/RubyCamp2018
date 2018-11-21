require_relative 'spec_helper'
require_relative '../positive_calculator'

RSpec.describe PositiveCalculator do

  describe '#add' do
    context 'valid result return' do

      it 'returns 0 when given empty string' do
        expect(subject.add('')).to eq(0)
      end

      it 'when new line is a delimiter for numbers in string' do
        expect(subject.add('1\n2\n3')).to eq(6)
      end

      it 'when custom delimiter is passed' do
        expect(subject.add('//;\n1;2')).to eq(3)
      end

      it 'when numbers are to big' do
        expect(subject.add('1,1001')).to eq(1)
      end
    end

    context 'error raisen' do

      it 'when there are negative numbers in string' do
        expect { subject.add('-2,1') }.to raise_error(NegativesNotAllowed)
      end

      it 'when there are not enought numbers' do
        expect { subject.add('1\n') }.to raise_error(NotEnoughNumbers)
      end
    end
  end

  describe '#subtract' do
    context 'valid result return' do

      it 'when new line is a delimiter for numbers in string' do
        expect(subject.subtract('3\n1\n1')).to eq(1)
      end

      it 'when custom delimiter is passed' do
        expect(subject.subtract('//;\n2;1')).to eq(1)
      end
    
      it 'when numbers are to big' do
        expect(subject.subtract('1,1001')).to eq(1)
      end

    end

    context 'raises an error' do

      it 'when result is negative' do
        expect { subject.subtract('1,2') }.to raise_error(NegativesNotAllowed)
      end

      it 'when there are negative numbers in string' do
        expect { subject.subtract('-2,1') }.to raise_error(NegativesNotAllowed)
      end

      it 'when there are not enought numbers' do
        expect { subject.subtract('1\n') }.to raise_error(NotEnoughNumbers)
      end
    end

  end
end