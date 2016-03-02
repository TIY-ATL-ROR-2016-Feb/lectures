## Guessing Game Redux

Create a new git project containing the Object Oriented Guessing Game
code from Tuesday's lecture: `human.rb`, `counting.rb`, `game.rb`, and `run.rb`.

### Normal Mode

1. Add a new file `random.rb` containing `RandomPlayer` class
   that picks numbers randomly.
   
2. Then add a new file `smart.rb` containing a `SmartPlayer` class.
   This should be a computer player that makes intelligent decisions
   about how to guess based on the result of the last guess.
   
   *Note* that this may require tweaking the definition of `get_guess`
   to take an argument in each player class and passing the result of
   the last guess to `get_guess` in the Game class.

### Hard Mode

Copy our oo-hangman folder from today's lecture into your project and commit it.
Now, try to think of a test case or property to check about each of the
player, dictionary, and game classes. Note that a `tests.rb` file has been added.

Study it's structure and try to add your test cases referring back to the
`tests.rb` from last night's HW as needed. Ask questions!
