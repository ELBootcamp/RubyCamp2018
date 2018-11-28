require 'spec_helper'
require_relative '../game'
require_relative '../frame'

RSpec.describe Game do
  context "checks creation of frames" do   
    it 'creates frame for two pins' do
      subject.roll(2)
      expect(subject.roll(4).values).to eq([2,4])
    end 
    it 'creates two frames for two round' do
      subject.roll(2)
      expect(subject.roll(3).values).to eq([2,3])
      subject.roll(1)
      expect(subject.roll(4).values).to eq([1,4])
    end 
    it 'creates two frames and in first frame is strike' do
      expect(subject.roll(10).values).to eq([10])
      subject.roll(1)
      expect(subject.roll(4).values).to eq([1,4])
    end 
    it 'creates four frames and in first frame is strike' do
      expect(subject.roll(10).values).to eq([10])
      subject.roll(1)
      expect(subject.roll(4).values).to eq([1,4])
      subject.roll(3)
      expect(subject.roll(5).values).to eq([3,5])
      subject.roll(7)
      expect(subject.roll(1).values).to eq([7,1])
    end 
  end

  context "checks scoring calculation" do   
    it 'returns correct scoring value when there was no rolls' do
      expect(subject.scoring).to eq(0)
    end
    it 'returns correct scoring value for two rolls' do
       subject.roll(2)
       subject.roll(2)
       expect(subject.scoring).to eq(4)
    end
  end
end