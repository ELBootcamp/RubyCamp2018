require_relative '../array'
require 'spec_helper'

RSpec.describe 'SelectionSort' do
  describe '#selection_sort' do
    context 'sorting array' do
      it 'sorts array when array elements are numbers' do
        unsorted_array = [3, 2, 1]
        a = unsorted_array.selection_sort
        expect(a).to eq(unsorted_array)
      end

      it 'sorts array when array elements are letters' do
        array = ['c', 's', 'a']
        expect(array.selection_sort).to eq(['a', 'c', 's'])
      end

      it 'sorts array when array elements are symbols' do
        array = [:c, :b, :a]
        expect(array.selection_sort).to eq([:a, :b, :c])
      end

      it 'sorts strings' do
        array = ["z1", "2", "a2"]
        expect(array.selection_sort).to eq(["2", "a2", "z1"])
      end
    end
    
    context 'handling edge cases' do
      it 'raises error when array elements are not the same type' do
        array = ['a', 2, 'c', nil]
        expect { array.selection_sort }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#selection_sort!' do
    context 'handling edge cases' do
      it 'raises error when array elements are not the same type' do
        array = ['a', 2, 'c']
        expect { array.selection_sort! }.to raise_error(ArgumentError)
      end
    end

    context 'sorting array and modifying original variable' do
      it 'sorts array elements as a selection_sort method does' do
        array = [122, 1111, 4]
        expect(array.selection_sort).to eq([4, 122, 1111])
      end

      it 'sorts array when array elements are numbers' do
        array = [3, 2, 1]
        sorted_array = array.selection_sort!
        expect(sorted_array).to eq([1, 2, 3])
      end

      it 'sorts array when array elements are letters' do
        array = ['c', 's', 'a']
        array_sorted = array.selection_sort!
        expect(array_sorted).to eq(['a', 'c', 's'])
      end

      it 'sorts array when array elements are symbols' do
        array = [:c, :b, :a]
        array_sorted = array.selection_sort!
        expect(array).to eq(array_sorted)
      end

      it 'sorts strings by bytecodes' do
        array = ["z1", "2", "a2"]
        array_sorted = array.selection_sort!
        expect(array).to eq(array_sorted)
      end
    end
  end
end