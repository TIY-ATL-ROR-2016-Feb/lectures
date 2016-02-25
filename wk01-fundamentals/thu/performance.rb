# toy = [1, 2, 3, 4]

toy = (1..20).to_a

toy.combination(2) do |x1,x2|
  puts [x1,x2]
end

## Performance

1. The order at which things grow is the thing that really matter.
-- The growth we want to track is steps taken by the CPU or memory used.

2. Benchmarking is hard
-- You have to account for variance between runs.
-- You have to know what's actually going on inside the machine.
   (And/or) your programming language and compiler

3. Finding the slow part of a program should always be done with a profiler
-- It will tell you what functions are being called a lot
   which is *WAYYYY* more important than what functions are slow
   and only called a little.

4. There are two ways to make a program faster:
-- 1. Speed up the work that has to be done.
-- 2. (the vastly better way) Do less work.

## Worst-Case

First thing in the array. If we look for it with 'find',
then we only have to look once, in the first box.
O(1), right?

WRONG! Big O and Algorithmic Analysis is about the
worst case! Searching through an array for a
specific element is **linear**. O(n) operation
due to the worst-case even if you get lucky and
your item is in the first position in the array.

## Constant Time - O(1)

toy = [1, 2, 3, 4]

toy[2]

## Linear Time - O(n)

toy = [1, 2, 3, 4]

toy.find(3)

## Logarithmic Time O(lg n)

## TODO: Think of good examples here.

## Optimal Sort Time - O(n log n)

## ruby .sort

## Quadratic Time O(n^2)

## pretty slow but can still do some real world stuff
## TODO: Add nice examples.
## combinations

## Cubic O(n^3)

## Polynomial Time O(n^4... )

## Exponential Time O(x^n)
