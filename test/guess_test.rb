require 'pry'

gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess'
require_relative '../lib/card'

class GuessTest < Minitest::Test

  def test_it_has_a_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("What color is the sky?", "Blue")
    guess = Guess.new("Juneau", card)
    assert_instance_of Card, guess.card
  end

  def test_it_has_a_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Juneau", guess.response
  end

  def test_it_finds_correct_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert guess.correct?
  end

  def test_if_it_gives_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Correct!", guess.feedback
  end

  def test_if_it_has_another_response
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    assert_equal "Saturn", guess.response
  end

  def test_if_it_finds_incorrect_answer
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    refute guess.correct?
  end

  def test_if_it_gives_another_feedback
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    assert_equal "Incorrect.", guess.feedback
  end
end
