## Good Morning

<img src="http://i.imgur.com/wLU3YVxr.jpg" width="70%">

---

## Getting Ready for Cross-Class Project

Y'all are gonna work in teams of 6-7
people to build a Social Photo Game.
Maybe you can call it clouds?

---

## Getting Ready for Cross-Class Project

The idea:

* Users can sign up and upload photos with a *short*
  caption which is hidden, their friends then try to
  guess the caption. First person to get it right wins!
  Lots of points, answer becomes public.

--

Each team of 4-5 will:

* Form a github organization
* Create repos for backend, frontend
* *This is the weekend assignment*

---

## A few things we still need ...

Today's topics:
* rack-cors
* Jbuilder
* Image uploads w/ Imgur (OAuth)

---

## rack-cors

These group APIs require all the features we've been
going over the last few days:

* Postgres as the database
* Deploying to Heroku
* Token Authentication (and disabling Rails' CSRF protection)
* Returning JSON, docs and status codes

One other feature we'll need to make the APIs accessible
in the browser via Javascript is CORS. (Cross-Origin Request Sharing.)
If rack-cors is not enabled, front end will not be able to make requests
to your API!

see: [here](https://stackoverflow.com/questions/19939207/heroku-rails-4-and-rackcors
)

---

## Introducing Jbuilder

For very simple responses, we've seen that you can just write
`render json: { foo: @bar }, status: :whatever` and sometimes
that is the best approach!

But often you'll want to construct JSON more carefully or build
larger responses. When that happens, you don't want to use `render json: ...`
It sort of becomes like writing a *view* in your controller, mixing logic
about the **presentation** of data versus **management** of data.

As the response gets more complicated, you should use a [JBuilder][jbuilder] view!
This article is a decent reference: [how to jbuilder][how-to-jbuilder].

[jbuilder]: https://github.com/rails/jbuilder
[how-to-jbuilder]: http://www.multunus.com/blog/2014/03/using-jbuilder-instead-erb-rendering-json-response/

---

## Remember your status codes!

**Note:** `render` takes a `status: :status_name`
option that recognizes the following [codes][status-codes].
In RESTful API design, we try very hard to send back an
appropriate status code so the user knows what happens on the server.

Popular codes:

* 200 - OK, that went well
* 201 - Created, cool we made that for you
* 202 - Accepted, we did what you asked us to (often used with PUT/updates)
* 204 - No Content (may be appropriate after DELETE-ing)
* 401 - Unauthenticated, you better login
* 403 - Unauthorized, you don't have permission to do that
* 404 - Page Not Found, sorry this object doesn't exist
* 422 - Unprocessable Entity, your data is garbage buddy

[status-codes]: http://apidock.com/rails/ActionController/Base/render#254-List-of-status-codes-and-their-symbols

---

## Testing

Just use [Postman](http://www.getpostman.com/), way more pleasant than curl and HTTParty!

---

## Deploying to Heroku

Remember, there's a great [getting started][heroku-start] guide and
I'm around to answer questions!

Keep in mind the best way to debug stuff if frontend says it doesn't work
is using `heroku logs --tail` and ask them to try what they were doing again.
See if it causes an error!

---

## Let's Talk about Workflow with Other Teams

* You're responsible for data. You need to document your APIs!

* It's important to let the other teams have an idea of what
  data you'll provide soon so they can start working.
  They can mock up test data if they know something about
  what your requests and responses look like.

* There is also room for discussion about what part of the "work"
  (I.e. computation) is done on the frontend vs backend. Think about
  what each other's responsibilities are!
  
  (And feel free to ask your instructors questions!)

---

## Homework

Start your app by getting a repo up under the github organization,
and deploying it to heroku with support for creating and deleting users via JSON API.

---

### Additional Resources

* Heroku would love to tell you about how you should use Puma as your underlying
  app server instead of Webrick. Not necessary for this project but it's not a hard
  change to make! Just add `gem 'puma'` to the gemfile and write a "Procfile".
  See [this guide](https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server).
