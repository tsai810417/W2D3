require 'rspec'
require 'deck'

RSpec.describe 'Deck' do
  subject(:deck){ Deck.new }
  describe '#initialize' do
    it 'Creates 52 card instances' do
      expect(deck.deck.length).to eq(52)
    end

    it 'Correct number of each kind of same symbol' do
      expect(deck.deck.select{|el| el.symbol == :H}.length).to eq(13)
    end
  end

  describe '#shuffle_deck' do
    it 'Shuffles the cards' do
      # beginning = deck.deck
      expect(deck.shuffle_deck).to_not eq(Deck.new.deck)
    end

  end
end
