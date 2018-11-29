require 'spec_helper'
require_relative '../game'
require_relative '../frame'

RSpec.describe Game do
  let(:sixteen_rolls) do
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

  context 'checks creation of frames' do   
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

    it 'creates six frames including strike' do
      subject.roll(1)
      expect(subject.roll(4).values).to eq([1,4])
      subject.roll(4)
      expect(subject.roll(5).values).to eq([4,5])
      subject.roll(6)
      expect(subject.roll(4).values).to eq([6,4])
      subject.roll(5)
      expect(subject.roll(5).values).to eq([5,5])
      expect(subject.roll(10).values).to eq([10])
      subject.roll(0)
      expect(subject.roll(1).values).to eq([0,1])
    end

    it 'creates ten frames including spare in the last frame' do
      sixteen_rolls
      subject.roll(2)
      subject.roll(8)
      expect(subject.roll(6).values).to eq([2,8,6])
    end

    it 'creates ten frames including strike in the last frame' do
      sixteen_rolls
      subject.roll(10)
      expect(subject.roll(6).values).to eq([10, 6])
    end

    it 'does not allow to roll more than three times in tenth round' do
      sixteen_rolls
      subject.roll(2)
      subject.roll(8)
      subject.roll(6)
      expect(subject.roll(6)).to eq('No more rolls allowed')
    end
  end

  context 'checks scoring calculation' do   
    it 'returns correct scoring value when there was no rolls' do
      expect(subject.scoring).to eq(0)
    end

    it 'returns correct scoring value for two rolls' do
      subject.roll(2)
      subject.roll(2)
      expect(subject.scoring).to eq(4)
    end

    it 'returns correct scoring value for four rolls' do
      subject.roll(2)
      subject.roll(2)
      subject.roll(3)
      subject.roll(1)
      expect(subject.scoring).to eq(8)
    end

    it 'returns correct scoring value for four rolls including spare' do
      subject.roll(2)
      subject.roll(8)
      subject.roll(3)
      subject.roll(1)
      expect(subject.scoring).to eq(17)
    end

    it 'returns correct scoring value for five rolls including strike' do
      subject.roll(1)
      subject.roll(4)
      subject.roll(10)
      subject.roll(1)
      subject.roll(4)
      expect(subject.scoring).to eq(25)
    end

    it 'returns correct scoring value for ten rolls including spare' do
      sixteen_rolls
      subject.roll(2)
      subject.roll(8)
      subject.roll(6)
      expect(subject.scoring).to eq(133)
    end

    it 'returns correct scoring value for ten rolls including spare' do
      sixteen_rolls
      subject.roll(10)
      subject.roll(6)
      expect(subject.scoring).to eq(139)
    end
    
    it 'returns correct scoring value for ten rolls including spare' do
      12.times do
        subject.roll(10)
      end
      expect(subject.scoring).to eq(300)
    end
  end
end
