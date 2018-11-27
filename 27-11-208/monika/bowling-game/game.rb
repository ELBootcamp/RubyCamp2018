require_relative 'frame'
class Game
  def initialize
    @round = 0
  end

  attr_accessor :round

  def roll(pins)
    # if round.zero? 
    #   round += 1
    #   Frame.new(round)
    # end
  end

  def scoring
    round.zero? && 0
  end
end


