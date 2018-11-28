require 'spec_helper'
require_relative '../game'

RSpec.describe Game do
  describe '#roll' do
    it 'checks if frames return array with specific frames' do
      subject.roll(2)
      expect(subject.frames).to eq([[2]])
      subject.roll(3)
      expect(subject.frames).to eq([[2, 3]])
      subject.roll(4)
      expect(subject.frames).to eq([[2, 3], [4]])
    end

    it 'checks if frames return two frames when player knocks down 10 pins in first try' do
      subject.roll(10)
      subject.roll(3)
      subject.roll(4)
      expect(subject.frames).to eq([[10], [3, 4]])
    end

    it 'raises ArgumentError when sum of pins in one frame is larger than 10' do
      subject.roll(2)
      expect { subject.roll(10) }.to raise_error(ArgumentError)
    end
  end

  describe '#score' do
    it 'checks if score returns good result' do
      subject.roll(1)
      subject.roll(4)
      expect(subject.score).to eq(5)
      subject.roll(4)
      subject.roll(5)
      expect(subject.score).to eq(14)
    end

    it 'checks if score returns good result after knocking down a spare' do
      subject.roll(3)
      subject.roll(7)
      subject.roll(6)
      expect(subject.score).to eq(23)
    end
  end

end