require 'spec_helper'
require_relative '../lib/frame'

RSpec.describe Frame do
  it 'creates frame' do 
    expect(subject.class).to eq(Frame)
  end

  it 'checks if adding new values with Frame#add_pin_num works' do
    subject.add_pin_num(1)
    subject.add_pin_num(4)
    expect(subject.values).to eq([1, 4])
  end

  it 'checks if #spare? returns proper result' do
    frame_with_spare = Frame.new
    frame_with_spare.add_pin_num(4)
    frame_with_spare.add_pin_num(6)

    frame_without_spare = Frame.new
    frame_without_spare.add_pin_num(4)
    frame_without_spare.add_pin_num(4)

    frame_with_strike = Frame.new
    frame_with_strike.add_pin_num(10)

    expect(frame_with_spare.spare?).to eq(true)
    expect(frame_without_spare.spare?).to eq(false)
    expect(frame_with_strike.spare?).to eq(false)
  end
end