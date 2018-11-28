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

  it 'checks if #strike? returns proper result' do
    frame_with_strike = Frame.new
    frame_with_strike.add_pin_num(10)

    frame_without_strike = Frame.new
    frame_without_strike.add_pin_num(4)
    frame_without_strike.add_pin_num(4)

    frame_with_spare = Frame.new
    frame_with_spare.add_pin_num(4)
    frame_with_spare.add_pin_num(6)

    expect(frame_with_strike.strike?).to eq(true)
    expect(frame_without_strike.strike?).to eq(false)
    expect(frame_with_spare.strike?).to eq(false)
  end

  it 'check if #bonus return proper result' do
    subject.add_pin_num(4)
    subject.add_pin_num(5)

    bonus_frame = Frame.new
    bonus_frame.add_pin_num(5)
    bonus_frame.add_pin_num(5)

    expect(subject.bonus(bonus_frame)).to eq(4)
  end
end