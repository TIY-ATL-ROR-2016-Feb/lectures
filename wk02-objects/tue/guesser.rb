require "pry"

class Game
  def initialize(max)
    @max = max
  end

  def guessing_game
    answer = rand(@max)
    puts "Please guess a number."
    guess = gets.chomp.to_i
    until guess == answer
      if guess > answer
        puts "Too High, guess again."
      else
        puts "Too Low, guess again."
      end
      guess = gets.chomp.to_i
    end
    puts "Congratulations!"
  end
end

guessing_game(100)
