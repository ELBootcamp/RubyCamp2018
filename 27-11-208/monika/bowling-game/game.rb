require_relative 'frame'
class Game
  def initialize
    @round = 0
  end

  attr_accessor :round

  def scoring
    round.zero? && 0
  end
end


