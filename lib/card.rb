# card.rb

ALLOWED_SUITS = [:hearts, :spades, :clubs, :diamonds]
ALLOWED_CARDS = (1..13).to_a

class Card
  attr_reader :value, :suit


  def initialize(value, suit)
    raise ArgumentError.new('Incorrect suit') unless ALLOWED_SUITS.include?(suit)
    raise ArgumentError.new 'Incorrect value' unless ALLOWED_CARDS.include?(value)
    @value = value
    @suit = suit
  end

  def to_s
    return "#{value_to_card_name(value)} of #{suit.to_s}"

  end

  def value_to_card_name(value)
    @basic_suits = (2..10).to_a
    return value if @basic_suits.include?(value)
    case value
    when 1
      return "Ace"
    when 11
      return "Jack"
    when 12
      return "Queen"
    when 13
      return "King"
    end
  end

end