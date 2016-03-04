require "minitest/autorun"
require "pry"

require "./human"

class HumanTests < MiniTest::Test
  def test_can_build_a_player
    assert Human.new
    assert Human.new("Brit")
  end

  def test_player_knows_their_piece
    brit = Human.new
    brit.stub :gets, "X" do
      brit.choose_piece
    end
    assert brit.piece == "X"
  end

  def test_cannot_make_illegal_move
    brit = Human.new
    brit.stub :gets, "7" do
      move = brit.make_move
      assert move.is_a?(Fixnum)
      assert (1..9).include?(move)
    end
  end

end


class GameTests < MiniTest::Test
  def setup
    player1 = Player.new
    player2 = Computer.new
    @game = Game.new(player1, player2)
  end

  def test_can_whatever_games_too
    @game.take_turn
    @game.whatever
    assert @game.turn_count != 0
  end

  def test_games_also_do_this_right
  end

  def test_bad_things_can_never_happen
  end

  def test_winners_are_happy
  end
end
