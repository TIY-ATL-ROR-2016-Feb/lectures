## Jukeborx History

Fork and clone the [jukeborx][jukeborx] project from the course organization
page. Update it to track what songs are played, add a (API or HTML) route to
show the last 10 songs that were played.

[jukeborx]: https://github.com/TIY-ATL-ROR-2016-Feb/jukeborx

## Setup

Fork and clone the repo and run bundle as normal.

*Then*, you'll need to run the migrations to create the database and
run an import. Against my better judgement, I'm going to provide some
data for this purpose. Download and unzip [this file][here].
Then start jukeborx and when it reaches the binding.pry run
`import(path/where/you/unzipped/that/file)`.

If you have difficulty with the import, just slack me!

[here]: http://redlinernotes.com/docs/jukeborx.zip

## Running the App

As usual with Sinatra apps, just run `bundle exec ruby lib/jukeborx.rb`

## Normal Mode

1. Add migrations and model definitions for:
   * A User model with first name, last name, and email
   * A model of your own design that records what song was played,
     who played it, and when.
     * Note that this will require changing the "play" route to take an
       additional parameter that specifies the user who played the song.
       We don't have a real login system but we'll build one soon! :D

2. Make sure that when a song is played, a new entry is added to the table
   that tracks playback history.

3. Add a route for showing the last 10 songs played.

## Additional Resources

[ActiveRecord Migrations Guide]: http://guides.rubyonrails.org/active_record_migrations.html
