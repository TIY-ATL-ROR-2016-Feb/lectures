# Githubber

## Description

Work independetly to extend the code from lecture for
interacting with the "issues" features of the Github API.

Once you're done, push your code to github and post the link
to *your fork* on the TIY Online assignment.

## Setup

Fork and clone the [homework repo][hw-repo] on github.
When you visit the repo page on Github, you'll see a "Fork"
button in the top right. Click that to create your own copy
of the repo on your Github profile. Then clone the repo to
get a local copy of the code you can modify.

Github provides instructions on how to clone a repo [here][cloning].

[cloning]: https://help.github.com/articles/fork-a-repo/#step-2-create-a-local-clone-of-your-fork
[hw-repo]: https://github.com/TIY-ATL-ROR-2016-Feb/homework

## Objectives

### Learning Objectives

After completing this assignment, you should...

* Better understand how to interact with external APIs
* Have more experience using Hashes and passing params to an API

### Performance Objectives

After completing this assignment, you'll be able to effectively use...

* HTTParty to make API requests
* Headers to authenticate API requests

## Details

### Normal Mode

Add methods to the Github class to support:

* Listing the Issues on a Repo
* Close an Issue
* Leave a Comment on an Issue

Note that the last methods (closing an issue and leaving a comment)
both require us to send data in the request specifying what we'd like
to say as a comment or how to modify the issue.

This *was not covered in lecture* and is not very well discussed or
documented on the internet in my opinion. I am happy to discuss this
*and* three of my previous students (Joe, Sepehr, and Terri with the blue hair)
are wandering the space and would be happy to discuss it with you!

But, tl;dr: Whenever you are making a request with HTTParty, you can
pass a `body` option similar to the way we passed the `headers`.
That body option allows us to supply a hash with any parameters to the
request we want. Note that Github expects all data it receives to be
JSON encoded. So you may need to call `.to_json` on it like so...

`Github.patch("/some/route", headers: @headers,
                             body: { option: "value" }.to_json)`

I'm also happy to answer questions about this! Slack away!

## Additional Resources

* GitHub's API documentation for [authentication](https://developer.github.com/v3/#authentication) and [issue handling](https://developer.github.com/v3/issues/).
* [HTTParty](johnnunemaker.com/httparty/)
* A [TeamTreehouse article][article] on HTTParty

[article]: http://blog.teamtreehouse.com/its-time-to-httparty
