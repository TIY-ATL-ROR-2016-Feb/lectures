require 'minitest/autorun'

require './human'
require './coffee'

class CaffeineTest < MiniTest::Test
  def test_humans_tend_to_be_sleepy
    dave = Human.new "Dave"
    assert dave.alertness < 0.1
  end

  def test_humans_need_coffee
    matt = Human.new "Matt"
    refute matt.has_coffee?
    assert matt.needs_coffee?
  end

  def test_humans_can_drink_coffee
    mallory = Human.new "Mallory"
    tsmf = Coffee.new "Triple Shot Mocha Frappuccino"
    assert tsmf.full?

    mallory.buy tsmf
    mallory.drink!
    assert_within_epsilon mallory.alertness, 0.33, 0.1
    refute tsmf.full?
    refute tsmf.empty?
  end

  def test_humans_can_drink_all_the_coffee
    mallory = Human.new "Mallory"
    tsmf = Coffee.new "Triple Shot Mocha Frappuccino"
    mallory.buy tsmf

    3.times { mallory.drink! }
    assert tsmf.empty?
    assert mallory.alertness > 0.9
  end
end