# Hangman 2.0

## Data/Variables in the system
# * dictionary
# * guesses
# * turn_count
# * answer

## Open Questions
# How do we show progress? letter pool (alphabet - guesses)

## Behaviors/Actions are in the system
# * greeting / rules
# * until the game over
#   * show them the current game state/progress
#   * ask them for a guess
#   * do bookkeeping
# * tell them what happened

require "pry"
require "set"

word_list = [
  "puppies", "iron", "yard", "beer",
  "programmers", "coffee", "whiskey", "cigarettes",
  "bacon", "vices", "gambling", "star",
  "wars", "motorcycle", "elbow", "ruby"
]
answer = word_list.sample

# binding.pry

def greeting
  puts
  puts "Welcome to Hangman!"
  puts "Please guess letters and get this over with."
  puts "I'm too lazy to tell you the rules."
  puts
end

def keith_win?(guesses, answer)
  word = intermediate_word(guesses, answer)
  !word.include?("-")
end

def win?(guesses, answer)
  answer.chars.all? { |l| guesses.include?(l) }
  # answer.chars.all? do |letter|
  #   guesses.include?(letter)
  # end
end

def lose?(turn_count)
  turn_count.zero?
  # turn_count == 0
end

def game_over?(guesses, answer, turns)
  win?(guesses, answer) || lose?(turns)
end

def intermediate_word(guesses, answer)
  result = []
  answer.each_char do |letter|
    if guesses.include?(letter)
      result.push(letter)
    else
      result.push("-")
    end
  end
  result.join
end

def show_progress(guesses, answer, turn_count)
  puts
  puts "You have #{turn_count} turns left."
  puts "You already guessed #{guesses.to_a.join(", ")}."
  puts "The word is: #{intermediate_word(guesses, answer)}."
end

def take_turn(guesses)
  puts "Please guess a letter: "
  guess = gets.chomp.downcase

  until ("a".."z").include?(guess) && !guesses.include?(guess)
    if guesses.include?(guess)
      puts "You already guessed #{guess} dummy! Guess again: "
    else
      puts "Guesses can only be one letter. Guess again: "
    end
    guess = gets.chomp.downcase
  end
  guess
end

def hangman(answer)
  turn_count = 7
  guesses = Set.new
  greeting
  until game_over?(guesses, answer, turn_count)
    show_progress(guesses, answer, turn_count)
    guess = take_turn(guesses)
    guesses.add(guess)
    turn_count -= 1 unless answer.include?(guess)
  end
  postmortem
end

def postmortem
  ## TODO: Flesh out postmortem to tell the player
  ## the word and whether they won or lost.
end

binding.pry

hangman(answer)
