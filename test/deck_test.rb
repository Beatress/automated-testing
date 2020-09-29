require_relative 'test_helper'

describe Deck do
  # Write tests for the Deck class.
  # What should you test?
    # 1.  Expected Behavior
    # 2.  Edge cases TODO
  describe "Deck can be instantiated" do
    let(:new_deck) {
      new_deck = Deck.new
    }

    let(:nums) {
      nums = (1..13).to_a
    }

    let(:allowed_suits) {
      allowed_suits = [:hearts, :spades, :clubs, :diamonds]
    }

    it "Has the correct number of cards" do
      expect(new_deck.count).must_equal 52
    end

    it "Contains the correct cards" do
      300.times do
        rand_num = nums.sample
        rand_suit = allowed_suits.sample
        rand_card = Card.new(rand_num, rand_suit)
        expect(new_deck).must_include rand_card
      end
    end

  end

  describe "Deck methods can be called upon" do
    let(:new_deck) {
      new_deck = Deck.new
    }

    let(:shuffled_deck) {
      shuffled_deck = new_deck.shuffle
    }

    let(:nums) {
      nums = (1..13).to_a
    }

    let(:allowed_suits) {
      allowed_suits = [:hearts, :spades, :clubs, :diamonds]
    }

    it "Can be shuffled" do
      expect(new_deck).wont_equal shuffled_deck

    end

    it "Shuffled deck has correct number of cards" do
      expect(shuffled_deck.count).must_equal 52

    end

    it "Contains the correct cards" do
      300.times do
        rand_num = nums.sample
        rand_suit = allowed_suits.sample
        rand_card = Card.new(rand_num, rand_suit)
        expect(shuffled_deck).must_include rand_card
      end
    end

    it "Cards can be drawn" do
      52.times do
        card = new_deck.draw
        expect(allowed_suits).must_include card.suit
        expect(nums).must_include card.value
      end
    end

    it "Cards can be drawn from a shuffled deck" do
      52.times do
        card = shuffled_deck.draw
        expect(allowed_suits).must_include card.suit
        expect(nums).must_include card.value
      end
    end
  end


end
