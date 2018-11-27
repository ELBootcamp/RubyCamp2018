require 'spec_helper'
require_relative '../game'

RSpec.describe Game do
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

end