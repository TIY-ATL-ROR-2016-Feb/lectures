require './dictionary'
require './player'
require './human'
require './random'

require 'minitest/autorun'

class HumanPlayerTests < MiniTest::Test
  def setup
    @player = HumanPlayer.new
    @brit = HumanPlayer.new("Brit")
  end

  def test_can_make_player
    assert @player
    assert @brit
  end

  def test_can_get_names
    assert_equal @brit.name, "Brit"
    assert_equal @player.name, "The Nameless One"
  end

  def test_can_validate_guess
    assert @player.valid_guess?("a")
    refute @player.valid_guess?("cookies")
    refute @player.valid_guess?("A")
    refute @player.valid_guess?("!")
    refute @player.valid_guess?("42")
  end

  def test_can_get_guess
    valid_input = ('a' .. 'z').to_a
    100.times do
      guess = valid_input.sample
      @player.stub :get_input, guess do
        assert_equal @player.get_guess, guess
      end
    end
  end
end

class RandomPlayerTests < MiniTest::Test
  def test_can_build_player
    assert RandomPlayer.new
    assert RandomPlayer.new("Rando Calrissian")
  end

  def test_only_returns_valid_guesses
    player = RandomPlayer.new
    100.times do
      guess = player.get_guess
      alphabet = ('a'..'z').to_a
      assert_includes(alphabet, guess)
    end
  end
end

class DictionaryTest < MiniTest::Test
  def test_can_build_dictionary
    dict = Dictionary.new
    assert dict.is_a?(Dictionary)
  end

  def test_can_get_random_word
    dict = Dictionary.new
    1000.times do
      word1 = dict.random_word
      word2 = dict.random_word
      assert word1 != word2
    end
  end

  def test_only_return_valid_words
    dict = Dictionary.new
    100.times do
      word = dict.random_word
      assert_match(/^[a-z]{4,20}$/, word)
    end
  end
end
