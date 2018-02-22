require 'rspec'
require 'game'

RSpec.describe Game do
  describe '#initialize' do
    subject(:game) {Game.new}
    it 'Create a new deck' do
      expect(game.deck).to eq(deck)
    end

    it 'Shuffle the deck'

  end

end
