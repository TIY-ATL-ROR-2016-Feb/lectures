## A simple FizzBuzz implementation

## Loop from 1 to 100
## If the number is divisible by 3 print Fizz
## If divisible by 5 print Buzz
## If divisible by both print FizzBuzz
## Otherwise print the number

def fizzbuzz(max)
  1.upto(max) do |x|
    if x % 15 == 0
      puts "FizzBuzz"
    elsif x % 5 == 0
      puts "Buzz"
    elsif x % 3 == 0
      puts "Fizz"
    else
      puts x
    end
  end
end

# x ? y : z

# if x
#   y
# else
#   z
# end


def fancy_fizzbuzz(n)
  1.upto(n) do |number|
    result = ""
    result += "Fizz" if number % 3 == 0
    result += "Buzz" if number % 5 == 0
    puts result == "" ? number : result
  end
end

fizzbuzz(100)
