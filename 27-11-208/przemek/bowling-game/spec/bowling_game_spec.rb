require 'spec_helper'
require_relative '../lib/bowling_game'

RSpec.describe BowlingGame do
  it 'checks if roll add correct value to frames' do
    subject.roll(3)
    expect(subject.frames.first).to eq([3])
    subject.roll(5)
    expect(subject.frames.first).to eq([3, 5])
    subject.roll(8)
    expect(subject.frames).to eq([[3, 5], [8]])
  end

  it 'checks if correct frames are added when roll result in strike' do
    subject.roll(5, 4, 10, 3, 4)
    expect(subject.frames).to eq([[5, 4], [10], [3, 4]])
  end

  it 'check if BowlingGame#score return proper value for 6 rolls' do
    subject.roll(1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1)
    expect(subject.score).to eq(61)
  end
end