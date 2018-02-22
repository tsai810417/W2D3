require 'rspec'
require 'card'

RSpec.describe Card do
  describe '#initialize' do
    subject(:card){ Card.new(3, :S) }
    it 'Assign specific kind to a card and readable' do
      expect(card.kind).to eq(3)
    end
    it 'Assign specific symbol to a card and readable' do
      expect(card.symbol).to eq(:S)
    end
  end



end
