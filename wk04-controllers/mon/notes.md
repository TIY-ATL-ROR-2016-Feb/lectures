## Welcome To Web Programming

(Code from today's lecture is up at https://github.com/TIY-ATL-ROR-2016-Feb/jukeborx )

---

## Welcome To ~~Web Programming~~ HELL

--

* Just kidding. But weren't you scared?

* Y'all were like [so scared][scurred].

--

* You know I'd [never let you down][nlyd].

[scurred]: http://i.imgur.com/AJuPuJj.gifv
[nlyd]: http://i.imgur.com/9DlpKA1.gifv

---

## Let's Build a Jukebox (kinda)

### Problems

A couple of tricks we need ...

1. The ability to answer web requests.
2. The ability to trigger audio playback.
3. The ability to search audio files.

--

### Solutions!

1. Solved by `Sinatra`.
2. Solved by `Ruby`! (Using shell commands like "afplay").
3. Solved by `mp3info` aaaaand ... a bit of PORO [pre-written code][pwc].

---

## Getting Started

* `bundle gem jukeberx` and add `sinatra` to the Gemfile and `bundle`!
* Aaaand slap my [pre-written code][pwc] right in the lib directory WOOO!

--

### Why Pre-Written Code?1?

1. I didn't want to spend the whole class building it.
2. We can still talk about it for a minute!
3. Well, for one, it's just stupid "glue code".
4. It's worth talking through the difference between `spawn` and `system`.
5. It's also worth spending a minute looking at our first exception.

[pwc]: https://gist.github.com/kingcons/2cfb9a1ca02f7a3c9854

---

## My First Controller! Wheeeee

* `bundle show sinatra` shows us where the code is!
  * Sinatra looks just like our projects. lib folder, there's some stuff in there.
  * And it's only 2000 lines of code! Which is kind of awesome, because we could read it.

--

* A server is just a thing that listens for requests.
* A controller is a set of methods that answer specific requests.
* The application router determines which controller/method go with which request.

---

## My First Controller, part deux

* Ultimately, it is the controller's job to receive a request,
  do any work needed talking to the database or *whatever*,
  and build a response to send back as HTML or JSON.

--

We got a request on the [port][ports] and everything!

--

* Note that until I set `RACK_ENV=production` when running
  `bundle exec ruby lib/jukeberx.rb` other users cannot connect to the server.
  It only runs on localhost.

[ports]: http://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers

---

## Sinatra and Miscellany

Sinatra is a bit weird:

* It makes some hard things (like routing web requests)
  easy but there's some magic so it takes some getting used to.

* That said, it's very easy to define a route, just write:
  `get '/hi' do ... end` to define a simple static route.

  To build a route that responds to multiple URLs, just write:
  `get '/hello/:name' do ... end` and whatever URL matches this
  pattern will go to the route. Inside the route's block,
  the variable `params` will be a hash that contains the parameters
  from the user.

  Query params sent to that route will be automatically added to `params`.

* As long as the thing we return from a route is some kind of string
  (like HTML or JSON) everything works just fine.

---

## Extra Resources

Interesting Sinatra reading I've dug up other than the docs is as follows:

* This [blog entry][sinatra_apps] on structuring sinatra apps and
  this [Sinatra app code][monocle] by it's author.
* This [article][mod_v_classic] from the Sinatra site on Modular vs Classic style.

[sinatra_apps]: http://blog.sourcing.io/structuring-sinatra
[monocle]: https://github.com/maccman/monocle
[mod_v_classic]: http://www.sinatrarb.com/intro.html#Modular%20vs%20Classic%20Style
