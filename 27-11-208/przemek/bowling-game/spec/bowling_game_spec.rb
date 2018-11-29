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
    subject.roll(5)
    subject.roll(4)
    subject.roll(10)
    subject.roll(3)
    subject.roll(4)
    expect(subject.frames_to_array).to eq([[5, 4], [10], [3, 4]])
  end

  it 'check if BowlingGame#score return proper value for 6 rolls' do
    subject.roll(1)
    subject.roll(4)
    subject.roll(4)
    subject.roll(5)
    subject.roll(6)
    subject.roll(4)
    subject.roll(5)
    subject.roll(5)
    subject.roll(10)
    subject.roll(0)
    subject.roll(1)
    expect(subject.score).to eq(61)
  end

  it 'check if BowlingGame#score handles 10th frame correcly' do
    game_10th_spare = BowlingGame.new
    game_10th_spare.roll(1)
    game_10th_spare.roll(4)
    game_10th_spare.roll(4)
    game_10th_spare.roll(5)
    game_10th_spare.roll(6)
    game_10th_spare.roll(4)
    game_10th_spare.roll(5)
    game_10th_spare.roll(5)
    game_10th_spare.roll(10)
    game_10th_spare.roll(0)
    game_10th_spare.roll(1)
    game_10th_spare.roll(7)
    game_10th_spare.roll(3)
    game_10th_spare.roll(6)
    game_10th_spare.roll(4)
    game_10th_spare.roll(10)
    game_10th_spare.roll(2)
    game_10th_spare.roll(8)
    game_10th_spare.roll(6)
    
    game_10th_strike = BowlingGame.new
    game_10th_strike.roll(1)
    game_10th_strike.roll(4)
    game_10th_strike.roll(4)
    game_10th_strike.roll(5)
    game_10th_strike.roll(6)
    game_10th_strike.roll(4)
    game_10th_strike.roll(5)
    game_10th_strike.roll(5)
    game_10th_strike.roll(10)
    game_10th_strike.roll(0)
    game_10th_strike.roll(1)
    game_10th_strike.roll(7)
    game_10th_strike.roll(3)
    game_10th_strike.roll(6)
    game_10th_strike.roll(4)
    game_10th_strike.roll(10)
    game_10th_strike.roll(10)

    max_game = BowlingGame.new
    12.times do
      max_game.roll(10)
    end
    expect(game_10th_spare.score).to eq(133)
    expect(game_10th_strike.score).to eq(137)
    expect(max_game.score).to eq(300)
  end

  it 'raises an ArgumentError if 10th frame contains more than 3 values' do
    subject.roll(1)
    subject.roll(4)
    subject.roll(4)
    subject.roll(5)
    subject.roll(6)
    subject.roll(4)
    subject.roll(5)
    subject.roll(5)
    subject.roll(10)
    subject.roll(0)
    subject.roll(1)
    subject.roll(7)
    subject.roll(3)
    subject.roll(6)
    subject.roll(4)
    subject.roll(10)
    subject.roll(2)
    subject.roll(8)
    subject.roll(6)
    expect { subject.roll(2) }.to raise_error(ArgumentError)
  end
end