require './lib/lcd_digits'
require 'spec_helper'

RSpec.describe LcdDigits do
  it 'raises ArgumentError if the argument is not a number' do
    expect { subject.build_lcd_digits('a') }.to raise_error(ArgumentError)
  end

  it 'checks if build method returns proper result' do
    expect(subject.build_lcd_digits(9)).to eq("._.\n|_|\n..|")
    expect(subject.build_lcd_digits(1)).to eq("...\n..|\n..|")
    expect(subject.build_lcd_digits(910))
    .to eq("._. ... ._.\n|_| ..| |.|\n..| ..| |_|")
    expect(subject.build_lcd_digits(234))
    .to eq("._. ._. ...\n._| ._| |_|\n|_. ._| ..|")
  end
end