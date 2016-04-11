## What a Weekend

Y'all worked very hard and from what I saw did a good job
staying in communication with your frontend teams and
debugging issues. This is the best glimpse we've had yet
into what real day-to-day programming looks like.

--

I hope it was exciting and rewarding to see how the
various pieces we've covered fit together, how much you
understand, and how much you can do working with a team.

--

![kitteh](https://media.giphy.com/media/26FPCXdkvDbKBbgOI/giphy.gif)

---

## Takeaways

#### Any high-level takeaways or thoughts y'all had about the project?

This afternoon we'll meet in the back at 3pm for demos.
Each group will have 5 minutes to show what they built.
You won't be presenting the code but the finished product.

--

If there are unfinished parts of the game, that's fine.
Feel free to talk about what your next steps would be,
interesting insights you had, or challenges you faced.

---

## What's Next?

A few high-level goals for this week:

* Use more advanced Railsisms like resources, mass assignment, and `form_for`
* Get some practice writing tests for our models and controllers
* See the changes that are coming soon in Rails 5
* Learn how to make apps with real-time updates/notifications using ActionCable

---

## Today

Hopefully a light-ish day.

--

* Testing Practice
  * Fixtures, rspec, and more, oh my!
* Railsisms: `resources`
  * A shorthand way of writing RESTful routes
* Travis CI
  * An automated testing service that makes sure every
    pull request and commit to master passes the test!
    (Also badges make your repos prettier.)

--

We'll use a reddit clone as our vehicle for this testing practice and
then see how to make it look nice with materialize or bootstrap tomorrow.

---

## Rails Testing Overview

3 big questions:

* Where do the tests go?

  In a directory called "test" if you're using Rails built-in testing
  library, or a directory called `spec` if you're using rspec.
  A fuller discussion of Rspec and it's benefits/flaws tomorrow.
  
  There's a group of other directories in there for different kinds of tests.
  More on that in a minute.

--

* How do you run them?

  `rake test` in Rails 4, `rails test` in Rails 5.

--

* What setup is needed?

  Rails expects a database specifically for testing.
  That's why you've got a test in `config/environments`, the `database.yml`,
  and the `Gemfile`. So set it up with `rake db:test:prepare` or
  do `createdb my-project-test`. Then you'll want fixtures. More on that soon.

---

## Different Kinds of Tests

There are many different kinds of testing: unit testing, feature testing, integration testing, performance testing, regression testing, and so on.

We'll mostly be concerned with unit testing and integration testing. So what are those?

--

Unit Testing (n):

* A test focused on the smallest possible unit of code, making sure that a single method or property about a class works as intended.

--

Integration Testing (n):

* A test which checks that multiple components work correctly *together*.

---

## Testing in the Wild

It's worth noting that there is not a universal standard as to how to test in programming and companies differ in:

--

* How they like to go about testing. (Write tests after, TDD, BDD, etc)
* How seriously they take code coverage. (Must have 80%+ or else vs Test what really matters.)
* What types of testing they emphasize. (Mostly unit tests, a few integration or vice versa.)

--

Code Coverage (n): A measurement of what percentage of your *lines of code* are touched by your test suite.

---

## Testing in the Wild 2.0


There are also performance implications to testing. Most people want tests to run
as fast as possible so they can check their work quickly and get into a cycle of:

* Write tests!
* Write code for your feature, run tests, fix failures, continue until tests pass
* Then: Cleanup code, run tests, fix failures if needed, continue until code is pretty

This is roughly the idea of TDD. Write tests *first* and then the tests will tell
you when you are done, like in CoffeeTime.

--

Generally speaking, Integration tests are slower because they involve more pieces
of your project, while Unit tests are faster because they depend on less.

As a result, some folks write tons of unit tests but don't integration test enough.
But integration tests make sure the pieces actually fit together. Both are important.

---

## Testing in Rails (models)

**NOTE:** All test files should begin with `require "test_helper"`!

You can also run specific files with `rake test test/models/foo_test.rb`

#### Model tests
  * Go in `test/models/foo_test.rb`
  * Inherit from `ActiveSupport::TestCase`
  * Define tests with `test "users have posts" do ... end`
  * Need a kind of test data called "Fixtures" to work.
    * "Factories" are an alternative to fixtures that some people prefer.
    * More about fixtures in juuust a second. 
  * Remember our testing methods: `assert`, `refute`, `skip`
    * Also: `assert_equal`, `assert_includes`, `assert_empty`, `assert_raises`, etc

---

## Testing in Rails (controllers)

#### Controller tests
  * Go in `test/controllers/foo_controller_test.rb`
  * Inherit from `ActionController::TestCase`
  * Many helpers in addition to `assert` and `refute` for controllers:
    * Can make HTTP requests like `get :controller_action`, for example...
        `put :update, { id: posts(:one).id }`
    * `assert_response`, `assert_redirected_to`, `assert_template`
    * Hashes you can access: `assigns` (for instance variables), `flash`, `session`
    * Instance variables you can access: `@request`, `@response`

---

## Testing in Rails (the rest)

#### Fixtures
  * Fixtures are YAML files in `test/fixtures` that are loaded into the test
    database each time the tests are run. They can be accessed in your tests
    based on the model name and the name of the fixtures entry, for example
    `posts(:rails5-thoughts)`.
  * Fixtures are given *random IDs* when they're loaded into the database.
    You can set up associations between fixtures using the associations directly.
    We'll see an example in just a few...

--

#### View tests
  * Fuck 'em
  * Clients, users, even we regularly change what data we want to be on the
    page or how we'd like it presented to the user.
  * It is my belief that these are more trouble than they're worth.
  * I've yet to see a company where they're strongly emphasized.

---

## Continuous Integration && Continuous Deployment

--

(Generalizing slightly)

Continuous Integration: The tests run on every single git push.

Continuous Deployment: Every time we push to master it redeploys the server if the tests pass.

--

Let's set up some continuous integration for free (on public projects) with Travis CI...

1. Sign up on their website using your Github account.
2. Add a `.travis.yml` file to your project specifying what database you use,
   what ruby versions to test with, and how to run your tests.
3. Add a beautiful badge to your project README!
   * Something like... `[![Build Status](https://travis-ci.org/gh-username/repo-name.svg?branch=master)](http://travis-ci.org/gh-username/repo-name)`

---

## Homework

* Group project presentations in the back at 3pm.

* Add a [Travis CI][travis-ci] badge to your fuhgeddit projects and at least
  two [tests][tests] for each model.

[travis-ci]: https://travis-ci.org/
[tests]: guides.rubyonrails.org/testing.html
