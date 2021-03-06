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

MAX_TURNS = 7

WORD_LIST = [
  "puppies", "iron", "yard", "beer",
  "programmers", "coffee", "whiskey", "cigarettes",
  "bacon", "vices", "gambling", "star",
  "wars", "motorcycle", "elbow", "ruby"
]

# binding.pry

def greeting
  puts
  puts "Welcome to Hangman!"
  puts "Please guess letters and get this over with."
  puts "I'm too lazy to tell you the rules."
  puts
end

def turns_left(guesses, answer)
  wrong_guesses = guesses - answer.chars.to_set
  MAX_TURNS - wrong_guesses.count
end

def win?(guesses, answer)
  # Are all the letters in the answer are in guesses
  guesses >= answer.chars.to_set
end

def lose?(guesses, answer)
  turns_left(guesses, answer).zero?
end

def game_over?(guesses, answer)
  win?(guesses, answer) || lose?(guesses, answer)
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

def show_progress(guesses, answer)
  puts
  puts "You have #{turns_left(guesses, answer)} turns left."
  puts "You already guessed #{guesses.to_a.join(", ")}."
  puts "The word is: #{intermediate_word(guesses, answer)}."
end

def take_turn
  puts "Please guess a letter: "
  guess = gets.chomp.downcase

  until ("a".."z").include?(guess)
    puts "Guesses can only be one letter. Guess again: "
    guess = gets.chomp.downcase
  end
  guess
end

def hangman(player1, player2, p1_guesses, p2_guesses)
  answer = WORD_LIST.sample
  current_guesses = p1_guesses
  current_player = player1
  greeting
  until game_over?(current_guesses, answer)
    show_progress(current_guesses, answer)
    guess = take_turn
    current_guesses.add(guess)

    if current_player == player1
      current_player = player2
      current_guesses = p2_guesses
    else
      current_player = player1
      current_guesses = p1_guesses
    end
  end
  postmortem(current_guesses, answer)
end

def postmortem(guesses, answer)
  if win?(guesses, answer)
    puts "Congratulations!!!! You're good at letters."
  else
    puts "Better luck next time. The word was: #{answer}."
  end
end

def play_again?
  puts "Want to play a game of Hangman? (y/n)"
  choice = gets.chomp.downcase

  until ["y", "n"].include?(choice)
    puts "Please choose 'Y' or 'N'."
    choice = gets.chomp.downcase
  end
  choice == "y"
end

def play
  more = play_again?

  while more
    puts "What is your name, Player 1?"
    player1 = gets.chomp
    puts "What is your name, Player 2?"
    player2 = gets.chomp

    hangman(player1, player2, Set.new, Set.new)
    more = play_again?
  end
end

play
