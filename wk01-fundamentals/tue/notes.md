# Good Morning!

<img src="http://i.imgur.com/8HRBMnm.jpg" height="600px" />

---

## Homework Review!

* Anyone want to present their solution for the guessing game or destutter?

---

# Today's Goals

1. Understand how to use Pry to make debugging/inspection easier
2. Practice decomposing problems and modeling data with Hangman
3. Reinforce understanding of functions, arguments, and scope

---

# Better Testing & Debugging w/ Pry

1. You can use it by running pry on the command line instead of irb.

--

2. Other than having tab-completion, syntax highlighting, and awesome commands
   like `ls`, `whereami` and `wtf`, we'll see next week it allows searching
   for methods, reading docs, and more.

--

3. But most importantly, you can put `require 'pry'` at the top of your ruby file
   and `binding.pry` in the place you want to debug or see what's happening and
   when your program reaches that point in execution, a shell will automatically open!
   No more annoying copying and pasting into IRB!

---

# 2. Let's Write Hangman!

* One of the first substantive scripts I wrote was a terminal version of Hangman back in 2008.
* Let's look at my old code and then write a better version!
* It's written in a language called "Common Lisp". Stay calm. :D

--

There are three big takeaways to look for:

--

1. Even though we don't understand the language, we can pick up the high level structure.
   Things like function calling, parameter passing, arrays are not so different!

--

2. A better design is generally better in *any* language.

--

3. If we can enforce a rule (aka **invariant**) by what data structures we use, that is almost always a good choice.

---

# 2. Moar hangman ...

A design process:

* Determine data requirements
* Create abstract description

--

Options for how to start:

* Pick the hardest thing first
* Pick the best understood (i.e. easiest) thing first

--

## What's hard about hangman?

2 main things:

* Deciding if the game is over
* Figuring out the half-completed word

Maybe also input validation but we'll save that for later. ;)

---

# Tonight's Homework

### [Happy Hacking!][homework]

.center[![computer_doge](http://40.media.tumblr.com/tumblr_m12hieqxHq1rrgr1no1_500.jpg)]

[homework]: https://github.com/TIY-ATL-ROR-2015-Sep/lectures/blob/master/wk01-ruby/tue/questions.md
