# codechamp

## Description

Pull and aggregate commit statistics from Github!

## Objectives

### Learning Objectives

After completing this assignment, you should…

* Be able to make HTTP requests from Ruby
* Be able to work with the nested JSON responses that most APIs return
* Have some understanding of Authentication through Request Headers

### Performance Objectives

After completing this assignment, you be able to effectively use

* HTTParty (or similar) for making requests
* Parsed JSON responses

## Details

### Deliverables

* A new git repo under your account called "codechamp"!

To create this, navigate to your TIY projects folder and run
`bundle gem codechamp`. Then `cd codechamp` to enter the directory
and `git commit -m "Initial commit"` to make your first commit to
the project (bundle gem will run `git init` for you).

Finally, open the Gemfile and add `gem 'httparty'` and `gem 'pry'`
and run `bundle` on the command line to ensure these gems are fetched.
Use `git` to add and commit the changed files. Now you can start hacking!
You'll probably want to add Github and App classes as we did in the
homework application.

At this point, you can start `Github` and `App` classes similar to what we
did in our homework repo. To run your code as you go, just use the command:
`bundle exec ruby lib/codechamp.rb`

### Requirements

Running `bundle exec ruby lib/codechamp.rb` should:

* Prompt the user for an auth token (see auth note)
* Ask the user what org/repo to get data about from github
* Print a table of contributions ranked in various ways
* Ask the user if they'd like to fetch another or quit.

Start by testing with a small repo like:

`kingcons/coleslaw`
`sinatra/sinatra`

Then maybe later try big repos like:

`ruby/ruby`
`seattlerb/minitest`
`rails/rails`

### Authorization

We'll still want to pass headers to Github to authorize our requests but,
rather than storing the OAUTH_TOKEN as an environment variable on the
command line, I'd suggest having the app prompt the user for their token
and then passing it as an initialize argument to `Github.new`.

## Normal Mode

Get the list of [contributions][contributors] for the specified repo.
Get the information on lines added, deleted, and the commit count.
Note: You don't have to track contributions by week, just sum them to get a total.

[contributors]: https://developer.github.com/v3/repos/statistics/#contributors

Once all the contributions have been collected for a repo, offer to sort
the users by:

1) lines added
2) lines deleted
3) total lines changed
4) commits made

Then print the commit counts in a table as below:

```
## Contributions for 'owner/repo'

Username      Additions     Deletions     Changes
User 1            13534          2954        6249
User 2             6940           913        1603
...
```

Finally, ask the user if they'd like to sort the data differently,
fetch another repo, or quit.

## Hard Mode

* Allow the user to specify just an organization. Get data for *all* it's
  repos and aggregate the data to rank the members of the organization.
  Be mindful of rate limits!

[members]: https://developer.github.com/v3/orgs/members/#public-members-list


## Nightmare Mode

Read the Github docs on [Pagination][pagination] and the Link Header in
particular. Ensure that you retrieve *all* the data. Try testing this
on a large repo like `rails`

[pagination]: https://developer.github.com/v3/#pagination

## Resources

[httparty]: https://johnnunemaker.com/httparty/
