require 'spec_helper'
require_relative '../lib/bowling_game'

RSpec.describe BowlingGame do
  it 'checks if roll add correct value to frames' do
    subject.roll(3)
    expect(subject.frames_to_array).to eq([[3]])
    subject.roll(5)
    expect(subject.frames_to_array).to eq([[3, 5]])
    subject.roll(8)
    expect(subject.frames_to_array).to eq([[3, 5], [8]])
  end

  it 'checks if frames_to_array method works properly' do
    automatize_rolls(subject, [5, 4, 10, 3, 4])
    expect(subject.frames_to_array).to eq([[5, 4], [10], [3, 4]])
  end

  it 'check if BowlingGame#score return proper value for 6 rolls' do
    automatize_rolls(subject, [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1])
    expect(subject.score).to eq(61)
  end

  it 'check if BowlingGame#score handles 10th frame correcly' do
    game_10th_spare = BowlingGame.new
    automatize_rolls(game_10th_spare, [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6])

    game_10th_strike = BowlingGame.new
    automatize_rolls(game_10th_strike, [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 10])

    max_game = BowlingGame.new
    12.times do
      max_game.roll(10)
    end
    expect(game_10th_spare.score).to eq(133)
    expect(game_10th_strike.score).to eq(137)
    expect(max_game.score).to eq(300)
  end

  it 'raises an ArgumentError if 10th frame contains more than 3 values' do
    automatize_rolls(subject, [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6])
    expect { subject.roll(2) }.to raise_error(ArgumentError)
  end
end

private

def automatize_rolls(game, rolls)
  rolls.each do |pin|
    game.roll(pin)
  end
  game
end