require 'spec_helper'
require_relative '../lib/frame'

RSpec.describe Frame do
  it 'creates frame' do 
    expect(subject.class).to eq(Frame)
  end
end