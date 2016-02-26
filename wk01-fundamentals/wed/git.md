## Git Basics

## Setup / Configure Git Author

Configuring your Git author data is important the first time you install git on a computer.
It ensures that your commit messages in the log are annotated properly with name and email.

* `git config --global user.name "John Smith"`
* `git config --global user.email "john.smith@googlemail.com"`

## Intro

Git is a version control tool for letting us keep track of changes made
to our source code. Actually, it's more than that. It's a time travel device
that lets us jump back and forth to see different versions of the code, see
the specific changes between two arbitrary points A and B, and even supports
alternate dimensions/multiple timelines. But we won't worry about that last
part today. :)

It's worth mentioning Git *doesn't* actually work by keeping track of
*files* like most backup tools you might be familiar with. Git really
tracks *changes* to our files, **not** the files themselves. This may
be confusing at first. Let's see some examples.

## Creating a new Git Repository (repo)

`git init .` - This command can be run in any directory to turn the current
directory into a git repo. Git then sets up a hidden folder (`.git`) in the
directory but takes no further actions.

`git clone git@github.com:TIY-ATL-ROR-2016-Feb/lectures.git` - Cloning is a
way of getting a local copy of an existing Git repo, usually from github in
this class.

**NOTE**: `git init` runs in whatever directory your terminal is currently
in. In particular, two things you want to *avoid* doing are creating a Git
repo while inside another Git repo or creating a Git repo while hanging
out in your home directory `~`. If you are currently inside a Git repo,
your shell prompt will end in `git:(master)` and a checkmark.

## How Git Works

Once you have an empty Git repo, no files are initially tracked regardless
of what is in the directory. There might be files we *don't* want Git to
track so we have to tell Git whenever we want it to start paying attention
to a new file or directory. We can tell git to track a file or directory
by saying `git add file_name_or_directory` from inside the Git repo.

When we add a file or directory its contents become "staged" until we
"commit" them. A Git repo is basically just a collection of *branches*
which are those alternate timelines I mentioned earlier. For the time
being, we're going to stick to the "master" branch which is the default
branch every repo starts with. Each *branch* is an ordered series of
*commits*. A *commit* is just a set of changes to one or more files,
made at a specific time by a specific person.

## Common Tasks

### Making Commits

To add new or update existing files, run `git add file_name_or_directory`.
The files are now "staged" so Git is tracking any changes and planning to
record them permanently when we make our next "commit". We can see the exact
changes by running `git diff --cached` and we can see all changes git is
aware of (whether it's tracking them or not) by running `git status`.

When you've reviewed the changes and the commit looks the way you want,
you can run `git commit -m "A short descriptive message about your changes."`
That will create a new commit and add it to the current branch.

**Note:** Add is used both to start tracking new files, and to stage changes to already tracked files. That is, when you make a change to a file after
it's been committed once that is a *new change* and you will need to add and
commit that specific change.

### Reviewing History

A complete history of the current branch can be viewed with `git log`
and you may look at the changes of any individual commit by running
`git show COMMITISH` where the "commitish" is either a hash identifying a
unique commit or a branch name in which case the latest commit on the branch
will be shown.

## Making Changes Public / Handling Remotes

Each git repository has a list of "remotes" it knows about which are other
copies of the repo online. You can list your current remotes with
`git remote -v` and each will be shown as a short name followed by a URL.

To send the changes on your current branch to the same branch on a remote,
you just write `git push remote-name branch`. It is common to call the
default remote `origin` so you will often find yourselves typing
`git push origin master` to send the changes on your master branch up to a
copy on Github.

**Note:** If you say `git push -u origin branch-name` you can push to that
branch from then on by just saying `git push`.

## Glossary / Recap

**Repository**: A collection of branches containing your code!

**Branch**: An ordered collection of commits that describe a complete history of the code.

**Remote**: Another copy of the same Git repo on a server or different computer, often github.

**Commit**: A set of changes made to one or more files by a specific author, at a specific time.

**Tracked**: A file that git watches. **No data is kept about untracked files.**

**Staged Changes**: Something that will be recorded the next time you run git commit.

**Unstaged Changes**: Changes made to your tracked files that will not be recorded in the next commit.

* `git status` to examine all local changes whether "staged" or "unstaged".
* `git diff` to see the current changes in unstaged files.
* `git diff --cached` to see the current changes in staged but not committed files.
* `git log` to view the commit history of the current branch.
* `git show [commit-hash]` to view a specific commit.
* `git add .` to add/stage all files or `git add FILENAME` to add/stage a specific file for the next commit.
* `git commit -m 'your message here'` to create a new commit with all staged changes.
* `git remote add NAME REMOTE_URL` adds a remote. You do this once after creating a New Repository on github.
* `git push -u origin master` pushes the first set of changes to the remote named "origin". It makes it the default for future pushes which is reasonable.
* `git push` will push any local commits not on the remote going forward.

