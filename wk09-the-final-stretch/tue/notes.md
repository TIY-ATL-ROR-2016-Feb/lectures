## Background Jobs ...

Are a bit complicated, yes.

--

Remember that the point of background jobs is that they let us run potentially long computations outside of Rails.

--

Because ActiveJob was introduced rather recently (in Rails 4.2) it can be difficult to find good resources on background jobs.

--

Two best resources I've seen are [this article][engine-resque] and the Rails [Active Job guide][aj].

[engine-resque]: https://blog.engineyard.com/2014/getting-started-with-active-job
[aj]: http://edgeguides.rubyonrails.org/active_job_basics.html

---

## Background Requirements

Background jobs require additional processes running on our computer besides Rails and the database.

* Redis - A message queue to send requests for Jobs to be done
* Resque - A job pool/manager

--

Add some gems: `resque`.

--

Add some routes: `mount Resque::Server.new, at: "jobs"`

--

May want to protect this. See [here](https://github.com/resque/resque/wiki/FAQ#how-do-you-protect-resque-web-with-devise).

---

## The Real Complications

* When do the jobs run?

--

* How do I know if they failed?

--

* What is loaded when the jobs run?

---

## Background Jobs (Setup)

You'll need to `brew install redis` if you haven't.

--

You'll need to configure Resque to find Redis and the Database.

--

More setup may be required if you want to be able to schedule jobs in the future or recurring times.

--

I have experience with the [clockwork] gem and liked it. [resque-scheduler] is also a thing.

--

Remember to add entries to your `procfile`! At least:

* `redis: redis-server`
* `resque: QUEUE=* rake environment resque:work` (or resque:workers with a `COUNT=n`)

--

And *tell Rails* which queue you're using in `config/application.rb` or an initializer: `config.active_job.queue_adapter = :resque`

[clockwork]: https://github.com/tomykaira/clockwork
[resque-scheduler]: https://github.com/resque/resque-scheduler

---

## Background Jobs (Usage)

1. Define a job in `app/jobs/my_job.rb`
2. Give it a queue with: `queue_as :foo`
3. Give it a perform method with any needed arguments: `def perform(bar) ... end`
4. Call it from controllers or clockwork to schedule jobs. `MyJob.perform_later`

---

## Backburner

There are also these articles you might refer to for more context or information:

* http://feministy.io/deploying-rails-41-apps-with-resque-to-heroku
* https://devcenter.heroku.com/articles/queuing-ruby-resque
* https://devcenter.heroku.com/articles/clock-processes-ruby

--

On heroku, you'll need to add the RedisToGo addon and might need to tweak some configuration. Not too bad.

--

Heroku does unfortunately charge for background job workers. :-/
