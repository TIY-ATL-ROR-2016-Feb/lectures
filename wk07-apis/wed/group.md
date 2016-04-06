### General Setup

1. Shared github repos

> In your github organization, you should create a new repo that will be shared
> by all (backend) developers on the team! Then, one of you should go ahead and
> create a project with `rails new foo`, add the remote, and push it. The other
> members of the team will then be able to clone that repo, make modifications
> and push them back to github.

2. Shared heroku deployments

> You will also want to share the heroku instance between team members. To make
> it so everyone on your team can deploy the latest code to heroku, one person
> will need to make the initial deployment with `heroku create` and
> `git push heroku`. Once that has been done, you can give your other team members
> permission to deploy and run commands on your heroku app with
> `heroku access:add joe@example.com`.

> Last note, Heroku only cares about deployments from the master branch.
> You should never need to push any branch *other* than master to Heroku.

3. Git workflow on team projects

> Since you'll both be sharing the same repo, it will be very difficult to work
> together if you do all your work on the `master` branch. I recommend every team
> member use the following workflow ...

  * Have someone make the initial commit after `rails new`.
  * After that, always create a branch for each new feature you're working on
    or bug you are fixing with a descriptive branch name, something like
    `git checkout -b add-user-model` or `git checkout -b post-controller-fixes`.
  * Get the code working in your branch, then push it to github and
    [open a pull request][open-pr].
  * Have **your teammate** have a brief skim over the code in the pull request
    and then they may merge it. If Github says the pull request cannot be merged,
    find Sepehr or myself and ask for help! (There are additional notes on
    merge conflicts below.)
  * Once the pull request is merged, you can checkout master and run
    `git pull origin master` to update your local copy of the code.
    This will also pull any changes your teammate has added to master
    since you last pulled. **This is the only command you should ever run
    on the master branch!**
  * Continue from step 2 (creating a branch) when it is time for your next feature.
  
[open-pr]: https://help.github.com/articles/creating-a-pull-request/

---

### Notes on Group Workflow

* The workflow you should follow is well described by github [here][gf]

* For deeper motivations behind the workflow, read [Understanding Github Flow][ugf]

[gf]: https://guides.github.com/introduction/flow/
[ugf]: http://scottchacon.com/2011/08/31/github-flow.html

---

### Notes on Merge Conflicts

* The correct response to a merge conflict is to merge master into
  *your* branch, thereby bringing in the new commits on master.
  *It is the responsibility of the "brancher" to make their code cleanly mergeable.*

--

* An important side note, **NEVER FORCE PUSH TO MASTER FOR ANY REASON**.
  When you force push to master, you forcibly change "history" and *always*
  screw up git for **everyone else** working on the project.
  Key point: Don't be a life ruiner.

--

* Note that the database isn't version controlled, so if you have *run*
  migrations, the database is *still migrated* on a different branch.

--

* There is also a guide from github about [resolving merge conflicts][rmc] on the command line.

[rmc]: https://help.github.com/articles/resolving-a-merge-conflict-from-the-command-line/
