age = 29

def add1(x)
  x + 1
end

def greeting(person, says)
  puts "#{person} says '#{says}'"
end

greeting("cary", "lunch!")
greeting("brit", "sleep!")
greeting("keith", "coffee!")


puts add1(age)
# puts age.methods

sky = :grey

if sky == :blue
  puts "Broad Street Lunch!"
elsif sky == :grey
  puts "Jimmy Johns!"
elsif age.zero?
  puts "Brit is not a person yet."
else
  puts "Hide in your home. Apocalypse."
end

puts "Broad Street Lunch!" if sky == :blue

if sky != :grey
  puts "Lunch is on."
end

unless sky == :grey
  puts "Lunch is on."
end

puts "Lunch is on." unless sky == :grey
