
# deck.rb

require_relative 'card'

class Deck

  def initialize
    @cards = []
    @allowed_suits = [:hearts, :spades, :clubs, :diamonds]
    @allowed_cards = (1..13).to_a
    @allowed_suits.each do |suit|
      @allowed_cards.each do |value|
        @cards << Card.new(value, suit)
      end
    end
  end

  def draw
    return nil if @cards.empty?
    return @cards.pop
  end

  def shuffle
    @cards = @cards.shuffle
    return self.clone
  end

  def count
    return @cards.length
  end

  def include?(card_to_search)
    @cards.each do |card|
      if card.value == card_to_search.value && card.suit == card_to_search.suit
        return true
      end
    end
    return true
  end
end
