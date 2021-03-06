# Morning Y'all

I hope you managed to relax some this weekend. (see [also][cuteovrflw])

[cuteovrflw]: http://i.imgur.com/OXPNJJz.gifv

--

<img src="http://i.imgur.com/EiUclFE.jpg" width="80%" />

---

# Preliminaries

This week we'll cover HTTP and pair programming...

--

* "Possibly the only real object-oriented system in working order." - Alan Kay speaking about the Internet

--

* "Hell is other people's code." - Sartre paraphrased

---

# Big Picture Goals for this Week

--

* Understand the universal language of HTTP (and a loose notion of RESTfulness)

--

* Gain comfort reading API docs and working with JSON responses

--

* Understand the distinction between URL encoding (queryparams) and postdata (form data)

--

* Solidify our understanding of Ruby objects and scope

--

* Begin to explore branches and pull requests for collaborating on projects

---

### Minutiae/Bonus

--

* Appreciate the various methods of authentication (Basic Auth, tokens, OAuth, etc.)

--

* Little ruby things: Maybe learn about Blocks, Regexes, or Class Methods

---

# Progress Reports

* Graded up to the weekend 2 assignment last night.

--

* Feel free to email me or grab me if you have questions!

--

* I'd love to do code review or expand on the progress report in 1-on-1 meetings. You can schedule them with me at https://calendly.com/brit/1-on-1/

---

## A Quick Recap

### Objects: A Primer

* Mechanics / What: Classes, Instances, Methods, Instance Variables
* Purpose   / Why? 

A hypothetical: You're writing a Tic Tac Toe game, you know you want to
represent a board with the numbers 1-9 or strings for players.

--

If we have a class called `Game` and just store an array inside it in
the instance variable `@board` we can write the code even quicker and
it will certainly work. **So why not just use an array?**

--

Yeah, we're trying to be object oriented for this project, but we
still should only create objects when we have a good reason to do so.

---

### Objects: A Primer

We do it to protect us from ourselves, to hide data, and to
create *specialized interfaces* for the task at hand. Here's the difference:

If I use an array, every part of my program has to know how to work
with the array. When I get data from user input, I have to think about
converting it to an index. When I want to check legal moves or update the
board I have to think about the *specific data representation* we chose.

I have to think about how the array does it's job.

--

If I use a board class, I can write all the methods I need inside the class.
Methods specific to tic tac toe. Then the rest of the program doesn't have to
think about *arrays*, it can think about *boards*. So can my fellow programmers.

Then I can write in Game...

```ruby
def take_turn
  spot = @current_player.make_move
  @board.put(@player.piece, spot)
  @board.display
  switch_players
end
```

---

### Objects: A Primer

This may not seem like a big deal but it makes a huge difference in real
production systems. Consider this, if you have a `Player` class with a
`get_move` method that returns a board position, should it return 1-9 or 0-8?

--

If you said 0-8, you saved a little time here in the present, but may have
accidentally created trouble for yourself in the future! Namely, the `Player`
class is now doing something to satisfy a hidden aspect of the `Board` class.
These parts of your system now rely on assumptions about how each other works!

If someone decides to make a change to the `Board` class, they'll need to know
to modify the `Player` class as well. The danger may not be pronounced here
but is very real in large production systems.

--

The Lesson:

All the variables we've worked with in the entire course were objects.

**We don't know how they store their data internally.**

We only know the ways we're allowed to interact with them.

---

## And Now For Something Completely Different

Let's Talk About The Web

![internets](http://img.pandawhale.com/55888-Abed-quote-EHNc.gif)

---

### Where are them servers?

* DNS / Name Resolution

redlinernotes.com isn't a "real" place

74.207.227.162 is the server's IP address

--

* IP Addresses

An IPv4 address is any group of four "octets"

0.0.0.0 up to 255.255.255.255

--

* What do I need to know?

DNS exists to map Domain Names to IP addresses.

We usually substitute domain names with all our
tools since they're easier to remember but IP
works just fine.

---

## How do we interact with them?

* Talk to them with a web browser, or better,
  an HTTP client
  * curl (command line tool, installed by default on mac/linux)
  * [httparty][httparty] (ruby library)
  
[httparty]: http://johnnunemaker.com/httparty/

--

Alan Kay said the internet is the only truly object oriented system
(though he also says some derogatory things about "the web"). We'll
see how in point of fact, the web is really just a series of **requests**
and **responses** made over HTTP.

--

* Let's start with the familiar and use Chrome's debugger to inspect
  some requests and responses.

---

## HTT What now?

* Hyper Text Transfer Protocol

Very simple idea:

* Just a special text format understood by all web servers.

* Client makes a **request**, Server sends a **response**

--

* Response has two essential pieces: status code and body.

* Browsers format the body (often HTML/CSS) for human usage but
  HTTP can carry arbitrary data. Doesn't have to be HTML or for
  use with a browser. see: `curl -4 http://wttr.in/atlanta`

--

* HTTP "Methods" ( different kinds of requests )
  * GET - Retrieve existing thing(s)
  * POST - Create a new thing
  * PUT - Update an existing thing
  * DELETE - Remove an existing thing

---

## So about those responses...

* Important HTTP [Response Codes][http_codes] (aka Status Codes)
  * 200 - OK / 201 - Created
  * 401 - Unauthorized
  * 404 - Page Not Found

* The broad response code categories
  * 2xx - Success
  * 3xx - Redirect
  * 4xx - Client made a mistake
  * 5xx - Server made a mistake

[http_codes]: http://en.wikipedia.org/wiki/List_of_HTTP_status_codes

---

## What can we do?

Well, that sort of depends on what API we want
to use.

API - Application Programming Interface

--

Really just that last word is important.
It's an interface. You've been reading API
docs this whole time for various Ruby things.
An API is just a contract that says,
"if you do this, i'll do that".

--

Any serious web service offers some sort of
public API. We'll look at Github's in a minute.

Two quick things before we do. You're going to
hear the words REST and JSON a **lot** so...

---

## What the hell are REST and JSON?

### JSON - Javascript Object Notation

Just a serialization format.

Like YAML, XML, others.

#### Got some text in JSON?

`require 'json'`

`JSON.parse my_text`

You get a hash table back.
Not much more to it really.

---

## What the hell are REST and JSON?

### REST - Representational State Transfer

Much like "Object Oriented", there is no precise and widely
accepted definition which leads to a lot of feels on the net.

For now, don't worry too much about REST.
We'll talk about it more soon!

---

## Homework: Curling with Github

I'm going to assign each of you a Github issue on the course [assigments repo][assignments].

I want you to close the issue using only curl and post a comment
describing the command you used to close the issue.

At that point, if you have assignments that are complete but unsatisfactory,
work on them and grab me for questions!

[assignments]: https://github.com/TIY-ATL-ROR-2016-Feb/assignments/issues
