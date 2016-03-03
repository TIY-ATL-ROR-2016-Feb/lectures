require "set"

class Game
  def initialize(dictionary, player)
    @dictionary = dictionary
    @player = player
    @guesses = Set.new
  end

  def guesses
    @guesses
  end

  def show_progress(answer, turn_count)
    sleep 1
    puts "The word is: #{"-" * answer.length}"
    puts "You have #{turn_count} turns left."
    puts "You guessed: #{@guesses.to_a.join(", ")}"
  end

  def win?(answer)
    @guesses >= answer.chars.to_set
  end

  def lose?(turn_count)
    turn_count.zero?
  end

  def game_over?(answer, turn_count)
    self.win?(answer) || self.lose?(turn_count)
  end

  def take_turn(answer, turn_count)
    show_progress(answer, turn_count)
    guess = @player.make_guess
    @guesses.add(guess)
  end

  def play
    answer = @dictionary.get_word
    turn_count = 7
    until game_over?(answer, turn_count)
      take_turn(answer, turn_count)
      turn_count -= 1 unless answer.include?(guess)
    end
  end
end
