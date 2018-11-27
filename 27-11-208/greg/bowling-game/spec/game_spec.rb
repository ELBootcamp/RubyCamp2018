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
  
end