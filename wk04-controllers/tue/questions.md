# HTTPunk 

## Description

Make a basic sampler / sequencer with Sinatra!

Work in pairs. One of you should define the
server and the other should work on writing API
bindings for the client and then a script to play
something *resembling* a song using your client.

Teams:
* Pat and Mitch
* Keith and Dave
* Jen and Tony
* Dane and Josh

## Objectives

### Learning Objectives

After completing this assignment, you should…

* Be able to build an API to expose and trigger song samples on your machine
* Be able to run shell commands from Ruby
* Rock!

### Performance Objectives

After completing this assignment, you be able to effectively use

* Sinatra for handling HTTP requests
* System calls and `afplay` to play songs
* Running commands with `system` and `spawn`

## Details

### Initial Setup

**Server:**
The person writing the server should create a new project with `bundle gem httpunk`,
then add `gem "sinatra"` to the Gemfile, add, commit and push to a new repo on Github.
Give the link to this project to your team member. Then checkout a branch called `server`.
Add a `lib/server.rb` file containing a basic empty Sinatra app [example][sinatra-app]
and continue from there to build out an API for use by your teammate.

**Client:**
Fork and clone the repository for the server. Checkout a new branch called `client`.
Now add `gem "httparty"` to the gemfile, then add a `lib/client.rb` file that has a
class for interacting with the server's API like in our Github examples last week.
Ask your teammate for their IP address to use in your `base_uri`. They can find their
IP address by running `ifconfig en0` and looking in the "inet" field.

### Deliverables

When you've finished your code, commit and push it to github.
Post the link to your repo on TIY Online with a note about
what branch you worked on.

We'll get the code merged up tomorrow!

### Requirements

Server:
* Running `RACK_ENV=production bundle exec ruby lib/server.rb` should
  start a server with endpoints described below

Client:
* Running `bundle exec ruby lib/client.rb` should start the client which will
  play something resembling a song by sending requests to the server! 

### Notes

1. You will need to work together to complete this project!
   One of you to run the server and the other to make requests with the client!

2. You can stop the server by typing `Control-C Control-C`.

3. When you make changes to the server, you will need to
   restart the server (but not the client!) for them to take effect.

## Normal Mode

Feel free to download the samples from [here][samples]. They're already
included in the project repo though.

Make an endpoint (API call) for each "phrase",
with query params for multiple versions: e.g.

* `POST /harder`
* `POST /better?v=2`

The `client.rb` script should play several samples
in the style and timing of your choosing.

## Hard Mode

Use `sleep` judiciously to play a reasonable cover with a backtrack
(see `beat.mp3`)

## Additional Resources

* [Try watching this](https://www.youtube.com/watch?v=gAjR4_CbPpQ)
* [samples][samples]

[samples]: http://redlinernotes.com/docs/daft-samples.zip
[sinatra-app]: https://gist.github.com/kingcons/1578041066b3ca5a266b
