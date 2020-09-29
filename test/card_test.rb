require_relative 'test_helper'

describe Card do
  describe "You can create a Card instance" do

    it "Can be created" do
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          expect(card).must_be_instance_of Card
        end
      end
    end

    it "Raises an ArgumentError for invalid parameters" do
      # To raise an ArgumentError in card.rb
      # raise ArgumentError.new
      expect {Card.new(0, :diamonds)}.must_raise ArgumentError
      expect {Card.new(14, :diamonds)}.must_raise ArgumentError
      expect {Card.new(14, :clovers)}.must_raise ArgumentError
    end
  end

  describe "Testing to_s" do
    before do
      @allowed_suits = [:hearts, :spades, :clubs, :diamonds]
    end

    it "to_s returns a readable String value logically for values 2-10" do
      @nums = (2..10).to_a
      100.times do
        rand_num = @nums.sample
        rand_suit = @allowed_suits.sample
        rand_card = Card.new(rand_num, rand_suit)
        expect(rand_card.to_s).must_equal "#{rand_num} of #{rand_suit.to_s}"
      end
    end

    it "to_s returns a readable String value for Ace, Jack, Queen, King" do
      # Test to ensure that to_s works for cards values 1, and 11-13
      # For example: "Queen of hearts"
      # The current implementation of to_s does not address this feature
      # Write the test, see it fail, then modify to_s to make it pass!
      # (Consider writing a helper method!)
      #
      # For reference:
      #  1: Ace
      #  11: Jack
      #  12: Queen
      #  13: King
      @nums = [1, 11, 12, 13]
      100.times do
        rand_suit = @allowed_suits.sample
        rand_num = @nums.sample
        rand_card = Card.new(rand_num, rand_suit)
        case rand_num
        when 1
          expect(rand_card.to_s).must_equal "Ace of #{rand_suit}"
        when 11
          expect(rand_card.to_s).must_equal "Jack of #{rand_suit}"
        when 12
          expect(rand_card.to_s).must_equal "Queen of #{rand_suit}"
        when 13
          expect(rand_card.to_s).must_equal "King of #{rand_suit}"
        end
      end
    end
  end

  describe "Reader methods" do
    before do
      @nums = (1..13).to_a
      @allowed_suits = [:hearts, :spades, :clubs, :diamonds]
    end
    it "Can retrieve the value of the card using a `.value`." do
      100.times do
        rand_num = @nums.sample
        rand_suit = @allowed_suits.sample
        rand_card = Card.new(rand_num, rand_suit)
        expect(rand_card.value).must_equal rand_num
      end
    end

    it "Can retrieve the value of the card using a `.suit`." do
      100.times do
        rand_num = @nums.sample
        rand_suit = @allowed_suits.sample
        rand_card = Card.new(rand_num, rand_suit)
        expect(rand_card.suit).must_equal rand_suit
      end

    end
  end

end
