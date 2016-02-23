require 'pry'

number = 42

puts "Please guess a number!"
guess = gets.chomp.to_i

until guess == number
  puts "Please guess again!"
  guess = gets.chomp.to_i
  binding.pry
end

puts "You win!"
