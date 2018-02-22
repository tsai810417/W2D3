require_relative 'deck'
require_relative 'card'

class Game
  attr_reader :deck

  def initialize
    @deck = Deck.new
    # deck.deck.shuffle!
  end


end
