## Description

Build Reddit (bookmarks and voting in Rails)

## Objectives

### Learning Objectives

After completing this assignment, you should be able to ...

* Tie together Models, Views, and Controllers into a functioning app
* Write a basic login system

### Performance Objectives

After completing this assignment, you should be comfortable:

* Using Forms and Links to enable users to navigate the app
* Using Rails Path Helpers
* Using [Rails Sessions][sessions] for authentication
* Using the Flash and Layouts to display messages to the user

[sessions]: http://guides.rubyonrails.org/security.html#sessions
[flash]: http://guides.rubyonrails.org/action_controller_overview.html#the-flash
[layouts]: http://guides.rubyonrails.org/layouts_and_rendering.html

## Details

### Deliverables

* A rails app that works as a link sharing site!

### Requirements

* Reddit is "User-generated news links. Votes promote stories to the front page."
* At a bare minimum, there should be users, links, and comments.

## Normal Mode

Normal mode is a simple, naive, implementation of Reddit without voting support.

* Users can sign up and login.
* Logged in users can post links.
* Logged in users can add comments.
* All users can see links on the homepage and their comments, ordered by how recent they are.
* Clicking on a link takes you to the thing it links to,
  clicking on comments takes you to a dedicated page for viewing and adding comments, just like reddit.

## Hard Mode

* Users can delete *their* links and comments.
* Users can vote on each link exactly once and votes have a value of -1 or +1.
* Links are ordered by some combination of how recent they are and how many points they have.

## Insane Mode

* Deploy the app to [Heroku](http://heroku.com)!
  * You'll need to sign up for an [Account](https://signup.heroku.com/login).
  * There's a getting started guide for [deploying Rails apps][heroku-rails4].
* Style it with [Bootstrap][bootstrap] or [Materialize][materialize]!
  * Getting started with Bootstrap and Rails guide [here](https://www.railstutorial.org/book/filling_in_the_layout).
* Add pagination to the app with [kaminari][kaminari].

[kaminari]: https://github.com/amatsuda/kaminari
[bootstrap]: https://getbootstrap.com/
[materialize]: https://materializecss.com/
[heroku-rails4]: https://devcenter.heroku.com/articles/getting-started-with-rails4

## Super Nightmare Mode

* Make it so comments can be voted on. Maybe look for a way to do [threaded comments][threaded].

[threaded]: http://en.wikipedia.org/wiki/Conversation_threading

## Additional Resources

* Read [Rails Layout and Rendering](http://guides.rubyonrails.org/layouts_and_rendering.html) (chapters 1 and 2)
* Read [Rails Routing from the Outside In](http://guides.rubyonrails.org/routing.html) (chapter 1)
* Read [Active Record Querying](http://guides.rubyonrails.org/active_record_querying.html)
* Read [Active Record Associations](http://guides.rubyonrails.org/association_basics.html)
* Read [Rails Action Controller Overview](http://guides.rubyonrails.org/action_controller_overview.html)
