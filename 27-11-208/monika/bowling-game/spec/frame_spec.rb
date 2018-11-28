require 'spec_helper'
require_relative '../frame'

RSpec.describe Frame do
  it 'discovers strike and spare' do
    subject.values = [4, 6]
    subject.check_ten
    expect(subject.is_spare).to eq(true)
    subject.values = [10]
    subject.check_ten
    expect(subject.is_strike).to eq(true)
  end
  it 'calculates sum of the frame' do
    subject.values = [4, 6]
    subject.check_ten
    expect(subject.frame_sum).to eq(10)        
  end
end
