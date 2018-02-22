require_relative 'card.rb'

class Deck
  attr_reader :deck
  def initialize
    @deck = Array.new
    set_deck
  end

  def set_deck
    [:S, :H, :D, :C].each do |symbol|
      (2..14).each do |kind|
        deck << Card.new(kind, symbol)
      end
    end
  end

  def shuffle_deck
    deck.shuffle!
  end
end
