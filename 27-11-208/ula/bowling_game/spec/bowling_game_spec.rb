require_relative '../lib/bowling_game'

RSpec.describe BowlingGame do
  describe '#score' do
    it 'scores a strike by adding sum of the next two rolls as a bonus' do
      simulate_the_game([10, 4, 1])

      expect(subject.score).to eq(20)
    end

    it 'scores a spare by adding 10 to the first roll of the next turn' do
      simulate_the_game([6, 4, 2, 8, 7, 2, 8, 2])

      expect(subject.score).to eq(48)
    end

    it 'correctly scores an entire game of misses' do
      game_of_misses = [3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0]
      simulate_the_game(game_of_misses)

      expect(subject.score).to eq(30)
    end

    it 'correctly scores consecutive strikes with miss in the last round' do
      simulate_the_game([10, 10, 10, 10, 10, 10, 10, 10, 0, 0])

      expect(subject.score).to eq(210)
    end

    it 'correctly scores consecutive strikes' do
      all_strikes = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
      simulate_the_game(all_strikes)

      expect(subject.score).to eq(300)
    end

    it 'adds the bonus to the last turn when a spare is rolled' do
      spare_in_last_round = [2, 1, 2, 1, 2, 1, 2, 1, 2, 3, 2, 3, 2, 2, 3, 2, 3, 3, 4, 6, 9]
      simulate_the_game(spare_in_last_round)

      expect(subject.score).to eq(56)
    end

    it 'correctly scores a game of consecutive strikes ending in a miss' do
      strikes_with_miss = [10, 10, 10, 10, 10, 10, 10, 10, 10, 5, 3]
      simulate_the_game(strikes_with_miss)

      expect(subject.score).to eq(261)
    end

    it 'throws an error when attempting to add more than then frames in game' do
      more_rolls = [10, 10, 10, 10, 10, 10, 10, 10, 10, 5, 3, 5, 3, 2, 4]

      expect { simulate_the_game(more_rolls) }.to raise_error(FramesCountExceeded)
    end
  end

  private

  def simulate_the_game(knocked_pins_list)
    knocked_pins_list.each { |score| subject.roll(score) }
  end
end
