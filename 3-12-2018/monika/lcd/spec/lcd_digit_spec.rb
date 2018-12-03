require './lib/lcd_digit'
require 'spec_helper'

RSpec.describe LcdDigit do
  it 'raises ArgumentError if the argument is not a number' do
    expect { subject.build('a') }.to raise_error(ArgumentError)
  end

  it 'checks if build method returns proper result' do
    expect(subject.build(9)).to eq("._.\n|_|\n..|")
    expect(subject.build(1)).to eq("...\n..|\n..|")
    expect(subject.build(910)).to eq("._. ... ._.\n|_| ..| |.|\n..| ..| |_|")
    expect(subject.build(2134)).to eq("._. ... ._. ...\n._| ..| ._| |_|\n|_. ..| ._| ..|")
  end
end