require 'spec_helper'
require_relative '../array'

RSpec.describe "SelectionSort" do
  context "sorting array simple" do   
    it "sorts an integer array" do
      expect([5,3,2].selection_sort).to eq([2,3,5])
    end

    it "sorts a string array" do
      expect(['c','b','a'].selection_sort).to eq(['a','b','c'])
    end
    
    it "sorts a symbol array" do
      expect([:c,:b,:a].selection_sort).to eq([:a,:b,:c])
    end
    
    it "sorts a string array that includes digits" do
      expect(['c','z2','1'].selection_sort).to eq(['1','c','z2'])
    end
  end
  
  context "sorting array with !" do   
    it "sorts an integer array" do
      input_array = [5,3,2]
      sorted_array = input_array.selection_sort!
      expect(input_array).to eq(sorted_array)
      expect([5,3,2].selection_sort!).to eq([2,3,5])
  -  end
  
    it "sorts a string array" do
      input_array = ['c','b','a']
      sorted_array = input_array.selection_sort!
      expect(input_array).to eq(sorted_array)
      expect(['c','b','a'].selection_sort!).to eq(['a','b','c'])
    end
    
    it "sorts a symbol array" do
      input_array = [:c,:b,:a]
      sorted_array = input_array.selection_sort!
      expect(input_array).to eq(sorted_array)      
      expect([:c,:b,:a].selection_sort!).to eq([:a,:b,:c])
    end
    
    it "sorts a string array that includes digits" do
      input_array = ['c','z2','1']
      sorted_array = input_array.selection_sort!
      expect(input_array).to eq(sorted_array) 
      expect(['c','z2','1'].selection_sort!).to eq(['1','c','z2'])
    end
  end

  context "error raising" do
    it "handles different types in input" do
      expect {['c',2].selection_sort!}.to raise_error(ArgumentError)
    end

    it "handles different types in input" do
      expect {['c',nil].selection_sort!}.to raise_error(ArgumentError)
    end
  end
end