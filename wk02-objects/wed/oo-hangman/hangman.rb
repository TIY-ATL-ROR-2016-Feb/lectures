require "pry"

require "./random_player"
require "./static_dict"
require "./file_dict"
require "./game"

dict = FileDict.new("/Users/brit/english-dict.txt")
hangman = Game.new(dict, RandomPlayer.new)
hangman.game_over?

game.play

## Behaviors
#* Pick a random word (from the dictionary)
#* Greet any players
#* Until the game ends, players take turns
  #* guess a new letter, see the board
  #* add the new letter to the guesses
#* Say what happened

## Objects
#* Player (TerminalHuman, InternetHuman, RandomComputer, AlphabeticalComputer, SmartComputer)
#  * Name
#  * make_guess
#* Game (SinglePlayer, MultiPlayer)
#  * Player, Dictionary, Answer, Turn Count/Max Turns, Guesses
#  * new(player, dictionary) -> Game
#  * play -> nil
#  * game_over? -> Boolean
#* Dictionary (StaticDictionary, FileDictionary)
#  * Words
#  * new(file=nil) -> Dictionary
#  * get_word -> String
