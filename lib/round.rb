require 'pry'

require_relative '../lib/guess'

class Round

  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def record_guess(guess)
    guess = Guess.new(guess, current_card)
    guesses.push guess
    deck.cards.shift
    guess
  end

  def current_card
    deck.cards.first
    deck.cards.last
  end

  def number_correct
    guesses.select { |guess| guess.correct? }.count
  end

  def percent_correct(deck)
    percent = number_correct / record_guess.to_i * 100
    return "#{percent}"
  end

end
