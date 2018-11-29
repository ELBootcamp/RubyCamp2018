require 'spec_helper'
require_relative '../game'

RSpec.describe Game do
  let(:nine_frames) do
    subject.roll(1)
    subject.roll(4)
    subject.roll(4)
    subject.roll(5)
    subject.roll(6)
    subject.roll(4)
    subject.roll(5)
    subject.roll(5)
    subject.roll(10)
    subject.roll(0)
    subject.roll(1)
    subject.roll(7)
    subject.roll(3)
    subject.roll(6)
    subject.roll(4)
    subject.roll(10)
  end

  let(:dummy_nine_frames) do
    18.times do 
    subject.roll(2)
    end
  end

  describe '#roll' do
    it 'checks if frames return array with specific rolls grouped by frames' do
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

    it 'checks if there are three rolls when player hits the spare in tenth frame' do
      dummy_nine_frames
      subject.roll(9)
      subject.roll(1)
      subject.roll(1)
      expect(subject.frames)
      .to eq([[2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [9, 1, 1]])
    end

    it 'checks if there are three rolls when player hits the strike in tenth frame' do
      dummy_nine_frames
      subject.roll(10)
      subject.roll(1)
      subject.roll(1)
      expect(subject.frames)
      .to eq([[2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [10, 1, 1]])
    end

    it 'checks if there are three rolls when player hits 3 strikes in tenth frame' do
      dummy_nine_frames
      subject.roll(10)
      subject.roll(10)
      subject.roll(10)
      expect(subject.frames)
      .to eq([[2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [10, 10, 10]])
    end
  end

  describe '#score' do
    it 'checks if score returns good result when player hit no spare or strike' do
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
      subject.roll(1)
      expect(subject.score).to eq(23)
    end

    it 'checks if score returns good result after knocking down a strike' do
      subject.roll(10)
      subject.roll(7)
      subject.roll(2)
      expect(subject.score).to eq(28)
    end

    it 'checks if score returns good result after nine frames' do
      nine_frames
      expect(subject.score).to eq(107)
    end

    it 'checks if score returns good result after tenth frame when player rolled a spare' do
      nine_frames
      subject.roll(2)
      subject.roll(8)
      subject.roll(6)
      expect(subject.score).to eq(133)
    end

    it 'checks if score returns good result after tenth frame when player rolled a strike' do
      nine_frames
      subject.roll(10)
      subject.roll(6)
      expect(subject.score).to eq(139)
    end

    it 'checks if score returns good result after tenth frame when player rolled a double strike' do
      nine_frames
      subject.roll(10)
      subject.roll(10)
      expect(subject.score).to eq(147)
    end

    it 'checks if score returns good result after twelve strikes in a row' do
      12.times do 
        subject.roll(10)
      end
      expect(subject.score).to eq(300)
    end
  end
end
