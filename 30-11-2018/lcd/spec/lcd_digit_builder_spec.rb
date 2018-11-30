require './lib/lcd_digit_builder'
require 'spec_helper'

RSpec.describe LcdDigitBuilder do
  it 'raises ArgumentError if the argument is not a digit within a range 0-9' do
    expect { subject.build(99) }.to raise_error(ArgumentError)
    expect { subject.build('a') }.to raise_error(ArgumentError)
  end
end