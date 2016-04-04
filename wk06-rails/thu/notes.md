## Enter Authentication

--

<img src="http://i.imgur.com/LM7RWkx.jpg" width="80%">

---

## Today's Agenda

--

0. Home Depot Recap

1. Morning Warmup with a Posts-Tagged-By route/method

2. Basic User model and Auth intro

3. Layouts, Flash, Sessions, Before Actions!

4. Better password management

---

## Step by Step(ish)

0. Any questions from Home Depot site visit?

--

  * Two big notes: Biggest thing they're looking for is acknowledgement that you're
    never done learning and a desire to continue learning more. Beyond that, testing
    and thinking about interfaces between different *modules* or software systems
    with their own *responsibilities* is clearly quite important. :+1:
    
--
    
    tl,dr: Continuing education is nonstop in programming. On some level,
    *none of us* will ever be good enough at this and that is *Okay*. In some ways,
    it's even fun. But always find new tools and knowledge you want and go get it.
    Fuck anyone that says you can't.
    
--
    
  * I don't think I've assigned "Institutional Memory and Reverse Smuggling" yet.
    * One of my favorite articles though describes an environment very different
      than Home Depot.

---

## Step by Step(ish)

1. Warmup! Add a route for viewing all posts with a certain tag
  * Link to that with the tags in post show view

2. Add a User model! Name, Email, Password, maybe some simple validations.
  * Add a unique index on email! (What are indexes for?)

3. We all know what a login page looks like. From the server's point of view,
   what problem does user login "solve"?
  * One of the best ways to understand our tools (activerecord, httparty, classes, etc) is to ask *what problem does this solve*?
  
4. Add registrations and sessions controllers. Use `@foo.errors` in the form!
  * Talk about `session[:foo]`.

---

## Step by Step(ish)
  
5. The two most common things the server will want to do are figure out
   who is making the current request and making sure a user is logged in
   to be able to view certain pages. Let's add methods to help with that!
  * Talk about `before_action`!
   
6. Add links to the layout for Login/Logout and Signup. Also mention the `flash`!

7. Make posts belong to a user, update how they're created in PostsController.
  * Modify a few methods based on user authentication? Flash messages?

8. Our password storage practices are bogus. Let's do a little better with `bcrypt`!
  * (and [`has_secure_password`][hsp])

[hsp]: http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html

---

### What Time Is It?

[Deploy to Heroku][heroku] if there's time!

[heroku]: https://devcenter.heroku.com/articles/getting-started-with-rails4

---

