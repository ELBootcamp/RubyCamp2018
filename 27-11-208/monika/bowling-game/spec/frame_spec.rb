require 'spec_helper'
require_relative '../frame'

RSpec.describe Frame do
  context 'discovers strike and spare' do
    it 'recognizes spare' do
      subject.values = [4, 6]
      subject.set_frame_values
      expect(subject.is_spare).to eq(true)
    end
    it 'recognizes strike' do
      subject.values = [10]
      subject.set_frame_values
      expect(subject.is_strike).to eq(true)
    end
  end
  context 'calculates sums of elements' do
    it 'calculates sum of all elements in the frame' do
      subject.values = [4, 6]
      subject.set_frame_values
      expect(subject.frame_sum).to eq(10)
    end
    it 'calculates sum of two first elements in the frame for strike' do
      subject.values = [4, 6, 5]
      subject.set_frame_values
      expect(subject.frame_sum_strike).to eq(10)
    end
  end
end
