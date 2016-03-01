require "pry"

class Game
  def initialize(max, player)
    @max = max
    @player = player
  end

  def play
    answer = rand(@max)
    puts "Please guess a number between 1 and #{@max}."
    guess = @player.get_guess(@max)
    puts "They guessed: #{guess}"
    until guess == answer
      sleep 0.25
      if guess > answer
        puts "Too High, guess again."
      else
        puts "Too Low, guess again."
      end
      guess = @player.get_guess(@max)
      puts "They guessed: #{guess}"
    end
    puts "Congratulations."
  end
end
