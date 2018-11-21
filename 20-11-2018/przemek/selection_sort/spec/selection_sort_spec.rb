require_relative 'spec_helper'
require_relative '../array.rb'

RSpec.describe 'SelectionSort' do

  describe '#selection_sort' do
    it 'sorts array' do
      arr = [5, 3, 7]
      expect(arr.selection_sort).to eq([3, 5, 7])
    end

    it 'sorts numeric array' do
      arr = [1.1, 1, 2]
      expect(arr.selection_sort).to eq([1, 1.1, 2])
    end

    it 'sorts string array' do
      arr = ['1z', '!b', 'a']
      expect(arr.selection_sort).to eq(['!b', '1z', 'a'])
    end

    it 'sorts comparable array' do
      arr = [:z, :b, :a]
      expect(arr.selection_sort).to eq([:a, :b, :z])
    end

    it 'raises error if array contains different types' do
      arr = [5, 3, 'a']
      expect { arr.selection_sort }.to raise_error(ArgumentError)
    end
  end

  describe '#selection_sort!' do
    it 'replaces array with sorted array' do
      arr = [5, 3, 7]
      sorted_arr = arr.selection_sort!
      expect(sorted_arr).to eq([3, 5, 7])
      expect(arr).to eq(sorted_arr)
    end

    it 'sorts numeric array' do
      arr = [1.1, 1, 2]
      expect(arr.selection_sort!).to eq([1, 1.1, 2])
    end

    it 'sorts string array' do
      arr = ['1z', '!b', 'a']
      expect(arr.selection_sort!).to eq(['!b', '1z', 'a'])
    end

    it 'sorts comparable array' do
      arr = [:z, :b, :a]
      expect(arr.selection_sort!).to eq([:a, :b, :z])
    end

    it 'raises error if array contains different types' do
      arr = [5, 3, 'a']
      expect { arr.selection_sort! }.to raise_error(ArgumentError)
    end
  end
end