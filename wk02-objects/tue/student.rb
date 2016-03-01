require "pry"

class Student
  def initialize(name)
    @name = name
    @energy = :wiped
  end

  def hello
    puts "Student continues being #{@energy}"
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end
end

binding.pry
