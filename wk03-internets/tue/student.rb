require "pry"
require "./puppies"

module Example
  class Student
    def initialize(first, last)
      @name = "#{first} #{last}"
    end

    def to_s
      "#<Student Name: #{@name}>"
    end
  end

  # Student here refers to the definition inside the module
  binding.pry
end

class Student
  def feed_me
    puts "SAMOAS SAMOAS SAMOAS!!!!"
  end

  def self.build_classroom
    students = []
    10.times do
      students.push(Student.new)
    end
    students
  end
end

# Student here refers to the definition outside the module

binding.pry
