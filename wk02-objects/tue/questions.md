## Guessing Game Redux

If you haven't done so already, create a github repo
for your homework assignments. In that repo, add a folder
for today's OO Guessing Game and copy in the files from today's
lecture: `oo_guesser.rb`, `human.rb`, `random.rb`, `counting.rb`.

Remember, **Rickard and I** are here for support with *git*.

### Normal Mode

Then add a new file `smart.rb` containing a `SmartPlayer` class.
The new player should make an intelligent to decision about how
to guess based on the result of the last guess. *Note* that this
requires tweaking the definition of `get_guess` to take an
argument in each player class and that the result of the last
guess must be passed from the `GuessingGame` class.

### Nightmare Mode

Choose one of the following:

* Change the guessing game to tell the player "Warmer" or "Colder"
  instead of "Too High" or "Too Low". Note that this necessitates
  changes to the `GuessingGame` class and your `SmartPlayer` class.

* Try to adapt Hangman to use classes in preparation for
  tomorrow's lecture. There should be at least Game and Human
  classes.
