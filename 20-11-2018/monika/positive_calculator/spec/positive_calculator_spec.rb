require 'spec_helper'
require_relative '../positive_calculator'

RSpec.describe PositiveCalculator do

  describe "#add" do
    context "error raising" do
      it "raises error when not enough numbers in input string" do
        expect {subject.add('1\n')}.to raise_error(NotEnoughNumbers)
      end
      it "raises error for negative numbers" do
        expect {subject.add('-2,1')}.to raise_error(NegativesNotAllowed)
      end
    end
    context "numbers addition" do
      it "adds numbers with delimiter defined at the beginning" do
        expect(subject.add('//***\n1***2')).to eq(3)
      end
      it "adds numbers with comma as seperator" do 
        expect(subject.add("1,5,5,4,6")).to eq(21)
      end
      it "adds numbers with new line as seperator" do
        expect(subject.add('1\n2\n3')).to eq(6)
      end
    end
    context "filtering" do
      it "handles empty string" do 
        expect(subject.add("")).to eq(0)
      end
      it "replaces big numbers with 0" do
        expect(subject.add('1,1001')).to eq(1)
      end
    end
  end
  describe "#subtract" do
    context "numbers subtraction" do  
      it "subtracts numbers with comma as seperator" do 
        expect(subject.subtract('10,4')).to eq(6)
      end

      it "subtracts numbers with new line as seperator" do
        expect(subject.subtract('3\n1\n1')).to eq(1)
      end

      it "subtracts numbers with delimiter defined at the beginning" do
        expect(subject.subtract('//;\n2;1')).to eq(1)
      end
    end
    context "error raising" do
      it "raises an error when not enough numbers in input string for subtraction" do
        expect {subject.subtract('1\n')}.to raise_error(NotEnoughNumbers)
      end
      it "raises an error when negative numbers are in input string for subtraction" do
        expect {subject.subtract('-2,1')}.to raise_error(NegativesNotAllowed)
      end
      it "raises an error when negative result is for subtraction" do
        expect {subject.subtract('1,2')}.to raise_error(NegativesNotAllowed)
      end
    end
    context "filtering" do
      it "handles empty string" do 
        expect(subject.subtract("")).to eq(0)
      end
      it "replaces big numbers with 0 for subtraction" do
        expect(subject.subtract('1,1001')).to eq(1)
      end
    end
  end
end
