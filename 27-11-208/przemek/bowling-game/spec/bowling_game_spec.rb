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
end