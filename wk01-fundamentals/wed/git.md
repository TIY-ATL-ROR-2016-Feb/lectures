## Git Basics

## Creating a Repo

* `git init .` in the directory you want the repo to be.
* `git clone SOME_GITHUB_URL` if you want to copy a repo up on github.

## Configure User Account

Configuring your user account is important the first time you install git on a computer.
It ensures that your commit messages in the log are annotated properly with name and email.

* `git config --global user.name "John Smith"`
* `git config --global user.email "john.smith@googlemail.com"`

You may also see a warning on recent git versions about using **matching** or **simple**.
**simple** is the new default and should be preferred. Run the associated command.

## Managing Local Repo / Changes

**Tracked**: A file that git pays attention to. No data is kept about untracked files.

**Staged**: Something that will be recorded the next time you run git commit.

**Unstaged**: Changes that have been made to your tracked files but will not be recorded in the next commit.

* `git status` to examine all local changes whether "staged" or "unstaged".
* `git diff` to see the actual text that has changed in the files.
* `git log` to view the commit history of the current repository and branch. (We'll learn about branches later.)
* `git show [commit-hash]` to view a specific commit. If called without a commit-hash, the latest commit is shown.
* `git add .` to add/stage all files or `git add FILENAME` to add/stage a specific file for the next commit.

  **Note:** Add is used both to start tracking new files, and to stage changes to existing/tracked files.
* `git commit -m 'your message here'` to create a new commit with all staged changes.

## Making Changes Public / Handling Remotes

* `git remote add NAME REMOTE_URL` adds a remote. You do this once after creating a New Repository on github.
* `git push -u origin master` pushes the first set of changes to the remote named "origin". It makes it the default for future pushes which is reasonable.
* `git push` will push any local commits not on the remote going forward.