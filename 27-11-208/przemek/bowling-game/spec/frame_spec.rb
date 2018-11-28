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
end