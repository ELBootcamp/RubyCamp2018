require_relative 'frame'
require 'byebug'

class Game
  def initialize
    @round = 0
    @counter = 0
  end

  attr_accessor :round, :counter

  def roll(pins)
    if @counter.zero? || pins == 10 
      @counter = pins
    else
      @round += 1
      frame = Frame.new(@round)
      frame.values = [@counter, pins]
      frame.check_ten
      @counter = 0
      p frame
    end
  end

  def scoring
    round.zero? && 0
  end
end


