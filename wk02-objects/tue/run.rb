require "pry"

require "./human"
require "./game"
require "./counting"

binding.pry

game = Game.new(100, Human.new)
game.play

binding.pry
