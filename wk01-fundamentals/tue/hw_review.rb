require "pry"

numbers = [1, 2, 3, 3, 4, 4, 3, 2, 1, 1]
# correct output: [1, 2, 3, 4, 3, 2, 1]

def map(seq, block)
  result = []
  seq.each do |item|
    piece = block.run_with(item)
    result.push(piece)
  end
  result
end


# Write a function to give back a result with no *sequential duplicates*.
def destutter(items)
  previous = nil
  result = []
  items.each do |current|
    if current != previous
      result.push(current)
    end
#    result.push(current) if current != previous
    previous = current
  end
  puts result
end

def destutter_mitch(ary)
  arycount = ary.count
  x = 0

  while x < arycount
    if ary[x] == ary[x+1]
      ary.delete_at(x+1)
    end
    x = x+1
  end
  ary
end

def destutter_destructive(items)
  previous = -1
  items.length.times do |index|
    current = items[index]
    if previous && current == items[previous]
      items.delete_at(index)
    end
    previous += 1
  end
  items
end

print destutter_destructive(numbers)

binding.pry
