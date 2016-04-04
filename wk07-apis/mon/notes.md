## This Week's Goals - Creating our own APIs!

* Token Auth
* Deploying to Heroku
* JSON responses / Active Model Serializers / Jbuilder
* GROUP PROJECT!

--

<img src="http://i.imgur.com/YGqAV3s.jpg" width="80%">

---

## How was your weekend?

<img src="http://i.imgur.com/yhmVZX9.jpg" width="80%">

---

## Today's topics

* Fuhgeddit Review
* How to do slightly more secure auth (i.e. password hashing)
* Installing Postgres.
* Deploying to Heroku ...
* Maybe more! :O

Everyone is wiped today, I bet.
Y'all wanna just get blankets and watch 90s movies?

<img src="http://del.h-cdn.co/assets/15/50/768x384/gallery-1449869632-home-alone-sundae.gif" width="80%">

---

## Review Topics

### Voting - WTF

It's fo sho a many-to-many, it needs has_many through associations.
Also, `validates :user_id, uniqueness: { scope: :link_id }`

```
Link
has_many :votes
has_many :users, through: :votes

User
has_many :votes
has_many :links, through: :votes

Vote
belongs_to :user
belongs_to :link
```

Computing scores:
```
link.votes.map(&:score).sum
link.votes.find_by(user_id: current_user.id)
```

---

## Sorting based on Votes

Top version is suffering from the N+1 queries problem!
Bottom version using Eager Loading Associations (chapter 13 of Rails Querying guide)

(http://guides.rubyonrails.org/active_record_querying.html#eager-loading-associations)

Also see Rails "Counter Cache" but note that this can occasionally not do what you expect.

```
@links = Link.page(whatever).per(10).sort_by { |link| link.votes.sum(:score) }
@links = Link.includes(:votes).page(whatever).per(10).sort_by { |link| link.votes.sum(:score) }
 ## Should be able to Link.includes(:votes).page(foo).per(10).order("SUM(votes.score)")
 ## or similar but I'm too tired to figure it out without the models set up
```

## link_to not great for off-site links

Do `<a href="<%= link.url %>">foo</a>` or ensure link starts with http://
(Or there is some other helper for this that I just can't remember.)

And ensure that every link gets saved with http(s):// at the beginning.

---

## Let's Do It Live!

![oh-bill](https://media.giphy.com/media/A34x7CEKUkCyc/giphy.gif)

* Time to put blarg into "production". A couple points...


* We should use Postgres instead of Sqlite for our database.
* Because we want to deploy to Heroku and heroku [doesn't support sqlite][no-sqlite].
* Crucially, we also want to maintain [parity][parity] between development and production.

---

## The Postgres Switch

Very simple to switch to postgres:

1. `brew install postgres` at the command line.
   Mac includes sqlite, not postgres. `which psql` should show: `/usr/local/bin/psql`

--

2. Unlike sqlite, postgres is a separate program that needs
   to be running so we can connect to the database.
   To make postgres start each reboot:
   ```
   mkdir -p ~/Library/LaunchAgents
   ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
   ```
--

3. Let's go ahead and start postgres now:
   `launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist`

--

4. Create a new database with postgres by running `createdb my-db-name`.
   Finally, update Rails' `config/database.yml` file, changing the
   adapter line to `postgresql` and the database line to `my-db-name`.

   (Note: Heroku will take care of creating the database on their end.)

[no-sqlite]: https://devcenter.heroku.com/articles/sqlite3
[parity]: http://12factor.net/dev-prod-parity

---

## Deploying to Heroku

There's a nice [getting started][heroku-start] guide.

#### tl;dr

Since we already got postgres ...

1. Install the heroku toolbelt!
2. Go to your rails repo on the command line.
3. Add rails_12factor gem, specify ruby version. `bundle`!
4. `heroku login` and `heroku create`. Now your repo has a heroku git remote!
5. Push your app with `git push heroku master` and don't forget
   to migrate it with `heroku run rake db:migrate`!
6. Finally, you can start your app with `heroku ps:scale web=1`.

* You can push updates to your heroku instance with `git push heroku master`.
  No need to restart the workers. It "just works"!

[heroku-start]: https://devcenter.heroku.com/articles/getting-started-with-rails4

---

## Your Life in Production

Notes about things that are different in prod:

* You can run migrations on heroku with `heroku run rake db:migrate` and
  the rails console with `heroku run rails c`.
* You shouldn't EVER `binding.pry` so you have to reproduce bugs locally or look at log files.
* You can use `heroku logs` to see recent logs or `heroku logs --tail` to watch
  them live as requests hit the server!
* There's also a rails command called `rails dbconsole` that will connect you
  to the SQL database! Be careful, working with live ammo here!
* [Billing model][billing] is free with just one web worker/dyno per month.
  Some additional notes about [postgres][postgres] worth peeking at.

[billing]: https://devcenter.heroku.com/articles/usage-and-billing#billing-cycle-current-usage
[postgres]: https://devcenter.heroku.com/articles/heroku-postgres-plans

---

# F.A.Q.

## How do you give someone access to push to your heroku app?

Follow the instructions at: https://devcenter.heroku.com/articles/sharing#add-collaborators

Make sure they add your heroku app to their git remotes!

## How do you get access to the Heroku Database prompt?

Run `heroku config` to get your database password.
(The bit in the DATABASE_URL after the colon and before the @ symbol.)

Run `heroku run rails dbconsole` and give it the password. Now you'll be at the
Postgres SQL prompt (psql). Type `\d` to get a list of tables, `\d NAME` to get a
specific table's schema, run SQL queries as normal, and `\q` to exit the prompt.
