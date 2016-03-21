## all method calls look like obj.method
## should be a method call, but there's no object? it's self

class Student
  attr_reader :name, :height
  attr_accessor :missing_hws

  def initialize(name, height)
    @name = name
    @height = height
    @missing_hws = 0
  end

  def play_ping_pong!
    missing_hws += 1
  end
end

dan = Student.new("Dan", "Taller than Brit")
dan.play_ping_pong!
dan.play_ping_pong!

puts dan.missing_hws
