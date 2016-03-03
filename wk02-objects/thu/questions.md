In this assignment, we'll revisit tic-tac-toe writing our
new implementation with an eye towards testability,
maintainability, object oriented design, and code quality.

Your work should be pushed to Github by Monday at 9am.

**Incomplete work that is on time and later refined is preferred to late work that is complete and bug-free.**

## Objectives

### Learning Objectives

After completing this assignment, you should…

* Understand basic OO principles
* Understand basic Unit Testing
* Appreciate the difficulty of changing code, and think about ways to make it easier

### Performance Objectives

After completing this assignment, you be able to effectively use

* classes (and maybe subclasses/inheritance) to encapsulate logic
* MiniTest and unit testing to ensure correct behavior
* instance variables to store data within a class

## Details

### Deliverables
In your labs repo ...

* a `tic-tac-toe.rb` script
* any other files required by that script
* a `tests.rb` file containing tests for your classes

### Requirements

* Running `./tic-tac-toe.rb` should play a game of tic-tac-toe in the terminal.

## Normal Mode

* A swappable `Player` class, which can be `Human` (gets input from
  the command line) or `Computer`. It should be possible to run a game
  with anywhere from 0 to 2 human players. The computer player does not
  need to choose moves intelligently.

* An option to play again after the game is over.

* At least 2 tests for each class. Input and Output methods don't need to be tested!

## Hard Mode

*Choose any* of:

* More testing! Any publicly exposed method should have at least 1 test!
  Again, screw testing private methods. The whole point is that we can change them at will.

* Add a Win-Loss-Draw scoreboard that displays after each game.

* Make the game support arbitrary (NxN) board sizes > 3.
  Maybe try starting with only odd-numbered board sizes to make diagonal wins easier.

* Make the computer player never lose, only draw.

## Notes

Think about your previous solution. Is it reusable, or is it better to
start from scratch? Were there things you could have done then to make
it easier to adapt now? Are there things you can do now which might
make it easier to adapt this code in the future?
