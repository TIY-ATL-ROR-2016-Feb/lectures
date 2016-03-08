# Good Morning!

I hope y'all are more high functioning today than [I am][sleepy-pup].

All signs pointing to [nope][nope].

[sleepy-pup]: http://i.imgur.com/kU5Jijg.gifv
[nope]: http://i.imgur.com/jDeqYBf.gifv

---

# Today's Topics

0. Wrote up a Recap Slide cause I just couldn't help myself
1. Modules
2. Bundler and Libraries
3. HTTParty!

--

Sidenote: Programming methodology discussion incoming this afternoon.
Will need to reschedule my 3:00 with Keith. No administrative meetings. \o/

---

# Recap

A few important things we learned last week:

### 1. Mechanics - Method Dispatch:

   > When a method is called on an object e.g. `thing.action(maybe_with_arguments)`,
   > the defining class of the object is searched for a method. If one is found, it is run.
   > Otherwise, the ancestors list e.g. `thing.class.ancestors` is checked until a method is
   > found. A NoMethodError is thrown if there is no matching method.

--

### 2. Mechanics - Inheritance:

   > A class can be made to subclass or "inherit" from another class like so:
   > `class RandomPlayer < Player`. The consequence of this is that all the methods
   > defined on Player are added to RandomPlayer *unless* it overrides them with
   > it's own definition. I believe this is often taught as the key part
   > of OO programming but should be carefully applied. It enables 
   > code reuse but does so in a brittle fashion.

---

### 3. Design - Encapsulation / Information Hiding:

   > Using `private` to make certain methods uncallable from outside a class is an excellent
   > way of keeping functionality that is likely-to-change from being accidentally relied on
   > or linked with other parts of the application. Similarly, it is often preferable to
   > *not* define reader and writer methods for the instance variables (e.g. `@example`)
   > of an object. If reasonable methods for interacting with the object are provided as part
   > of it's public interface, there is no need to expose the internals for modification.

--

### 4. Design - Duck Typing and Dependency Injection:

   > Duck Typing is the idea that you don't need objects of a particular class, just a
   > particular interface. "If it looks like a duck and quacks like a duck, it's a duck."
   > That is, for some program, any object that implements a `get_guess` method returning
   > a number is a suitable player. Dependency Injection is the idea that you can give one
   > object as an argument to another object at any time (but especially initialization).
   > This allows you to plug pieces easily and free the receiver from needing to know details.

---

# Modules

The cliffnotes are as follows:

--

* They *cannot* be instantiated! I.e. `MyModule.new` is not a thing.

--

* Containers for classes and/or methods.

--

* Two primary ways in which they are used:
  * To share behavior between multiple **unrelated** classes, such as Enumerable or Kernel.
  * To **Namespace** code.

---

# Namespacing

* Did he same namespacing?

--

<img src="http://zeroturnaround.com/wp-content/uploads/2015/09/erlang-map-reduce-comic.jpg" width="90%"/>

---

# Namespacing

* It's about being able to share code. We don't want names to clash.

* You don't want your "User" class to override the one defined by e.g. the Twitter gem.

--

* Normally represented with double colons. I.e. `MiniTest::Test` is a `Test` class in the `MiniTest` module.

--

* Let's see a quick example to demonstrate the scope implications.

---

# Mixins

Modules can also be used as "mixins". So what is a mixin and why do you care?

--

We've already talked *a little* about Inheritance. It doesn't make sense though
if you want to share behavior between objects that aren't *actually* related.
So RandomPlayer and CountingPlayer are both players and could be reasonably
put in an inheritance hierarchy. But playing cards and numbers are *wildly*
different. But both should be things we can rank or order as higher/lower.

--

* A way of adding methods/behavior to a class *without* an "Inheritance Hierarchy".

* Enumerable is a good example but a little lengthy. Let's write a playing Card that implements Comparable!

---

# Introducing Bundler and Libraries (Gems)

* `bundle gem $NAME` scaffolds out a project called $NAME for you.
  * Since it autogenerates folders and code, we avoid spaces, dots, colons, dashes, etc
    in our project names. We generally stick to lower case, too.

--

* Tweak the gemspec quickly. Gemspec is mostly for publishing to rubygems.
  * Making a gem is not magic! (But we won't see that today.)

--

* Add `httparty` gems. Put `pry` in the development group.

--

* Run `bundle` in the project directory and it grabs all the libraries we need.
  * Commit!
  
--

* From now on make sure to run your code prefixed with bundle exec so the `$LOAD_PATH` is set up!
  * E.g. `bundle exec ruby lib/my_project.rb`

---

## Let's HTTParty!

* Like [this][httparty]
* With [Github][github-api]

--

Ah, but what to build ...
How about a tool for assigning Github Issues to the whole class! :D

[httparty]: http://johnnunemaker.com/httparty/
[github-api]: https://developer.github.com/v3/

---

## Issues

Today:

* Getting comfortable with HTTParty
* Basic Project Structure
* Authorization via Tokens
* List teams in an org, members of a team, Get team members by team name


Tomorrow:

* Create issue, comment on issue, get gist, get gist content
* A nice command line interface for this. Generic prompt function! maybe `confirm`
* Maybe other stuff?
