# Welcome to the Iron Yard!

---

## Who Am I?

### [Brit Butler][brit]

[blog](https://blog.redlinernotes.com), [twitter](https://twitter.com/king_cons),
[code](https://github.com/kingcons), etc


I also like [making cocktails][cocktails], playing with [dogs][dogs], arguing about music,
and messing around with [modular synthesis](https://twitter.com/king_cons/status/680122316215418880).

[brit]: http://blog.theironyard.com/2014/12/20/meet-brit-butler-atlantas-new-ruby-instructor/
[cocktails]: https://twitter.com/king_cons/status/549049160918654976
[dogs]: https://twitter.com/king_cons/status/539154483943833600

---

# Introductions

#### We're gonna spend plenty of time staring at code.

![staring](http://gifstumblr.com/images/hacker_601.gif)

#### Let's get to know each other a bit first.


#### Describe when you were first excited by computers or programming.

---

# General Course Arc

* Weeks 1-3: Programming Fundamentals
* Weeks 4-6: Basics of the Web
* Weeks 7-9: Intermediate Interneting
* Weeks 10-12: Final Projects!

- Everyone is freaked out at some point in this course. Come talk to me or Lindsey Owings about it! Don't panic. :)

- Sidenote: I'll be out of town Friday, April 1st to attend the wedding of two of the weirdest humans I know. I'm also moving the previous weekend so I may be out some that Friday.

- I have administrative meetings Mondays at 2:00 and Wednesdays at 3:30.
  I also need some administrative time for the usual things: lecture prep, grading, interviews, etc.

---

# Schedule and Expectations

- Rule #1: In this course, you'll get out what you put in. I'm here to instruct and support you. **Communicate!**

--

- I care about your *experience* here, not just your education.
  Please reach out to Lindsey or I if there is an issue that detracts from your learning.
  If there's a problem, it's our job to fix it.

--

- Work life balance is important. I'm here to help you as much as possible but:
  * Don't Slack message me after 8pm.
  * I'll try to check Slack some over the weekend but there are no guarantees.
  * Your fellow students should certainly be checking though, don't hesitate to ask questions!

--

- Need debugging help during lab time? Use **Ironbot**! Just say `debug me` in the Backend slack channel.

--

- _Lecture notes will always be posted online_.

--

- *Review sessions* begin in **week 2**. *Progress reports* and *1-on-1 meetings* with me start in **week 3**.

---

# Programming is a Mindset

- I learned Ruby (and Rails) on-the-fly, on-the-job. Tools change. Some of the tools we use
  this semester I'll be using for the first time for the first time.

--

- Ignore the hate/Ignore the hype. Programming is **not** about *tools*. Let Google worry about the minutiae. :)

--

- Programming is all about trade offs. There are no perfect, finished programs. Software exists in a **social context**.

--

- You will spend half of your working life reading code, not writing it.

> "Thus, programs must be written for people to read,
>  and only incidentally for machines to execute."
>
>   _Structure and Interpretation of Computer Programs, Preface_

---

## Big Pictures Goals for Week 1

#### Minutiae

* Ruby
* Git
* Shell

#### Programming Fundamentals

* Scoping - When is a variable or method accessible
* Evaluation - Ability to reason about how code runs

#### Software Design Fundamentals

* Problem Decomposition
* Data Representation

#### Command Line Fundamentals

* Tab Completion
* Navigation
* Absolute vs Relative Paths

---

## Let's talk a bit about some of our tools ...

- Package Management
  * System level (homebrew for OSX)
  * Language level (bundler for Ruby)

--

- Editor / Programming Language
  * Great code and terrible code can be written with any language/editor

--

- Shell: Where did it come from? Why use it?

--

- Version Control: Where did it come from? Why use it?

--

- Cool! Time for some quick minutiae ...

---

# A Shell Checkup

### Concepts:

- navigation
- files vs directories
- absolute vs relative paths
- hidden files
- ~ / .. / -
- environment variables and the path

### Commands:

- pwd
- cd
- ls
- cp, mv, rm
- cat / less
- head / tail
- mkdir / rmdir
- clear
- ssh / sudo
- man / woman
- grep

---

## Big Picture Goals

### Understand when things are in Scope

- Bound vs Unbound variables

### Know the Substitution Model of Evaluation

- We'd like to be able reason about programs *algebraically*

- (This actually gets into some pretty deep stuff, Referential Transparency, etc)

### Know how to read an Expression

- Everything in Ruby is an expression, Functions return the value of their last expression

- By contrast, some other languages have "statements". Functions explicitly say `return some_result`

---

# Start your rubies!

## Let's talk data types!

- Booleans

--

- Numbers (Fixnums and Floats)

--

- Strings

--

- Symbols

--

- And more to come ...

---

# Variables and I/O

- Puts
- Gets
- Chomp

---

# Conditionals

### Basics: `if then else elsif end`
### One-legged: `when unless`

---

# Looping/Iteration and Functions

## Un-conditionally
- `for i in FOO` - **NEVER USE THIS**
- `n.times` - Do something a set number of times
- `1.upto(n)` - Useful for counting up
- `n.downto(1)` - Useful for counting down
- `items.each` - Do something with each item in a collection

## Conditionally
- `while this_is_true` - Continue running until the statement is false
- `until this_is_true` - Continue running until the statement is true

## Functions
- Definition: `def foo(bar); blah blah blah; end`
- Usage: `foo(123)` or `foo(cookies)`

---

# A larger example ...

## Let's Fizzbuzz!

---

# `ruby` vs `irb`

## (a.k.a Running and Testing your Damn Code)

- ruby is for running a file or complete program
- irb is for trying things out

- You can paste code into irb.
- You should get into a habit of trying out your functions (or even just snippets)
  as you go to make sure things work the way you expect.

---

# Today's Lab / Homework

### Go! Go! Go! [Happy Hacking!][homework]

.center[![hack_the_planet](https://33.media.tumblr.com/bd426ed8849ca171c70093023181f0ab/tumblr_mxnnox9Ro91qzh636o1_500.gif)]

_(Homework submission is done through TIY Online.)_

[homework]: https://github.com/TIY-ATL-ROR-2016-Feb/lectures/blob/master/wk01-fundamentals/mon/questions.md
