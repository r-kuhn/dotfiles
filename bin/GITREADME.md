# Git Helpers

A set of small scripts for use with git. Put the checked-out directory
in your path, and git will automatically allow you to run them as git
subcommands. For example, running `git parent` will run the `git-parent`
script in this directory.

The scripts are tested in OS X 10.11 with the git distributed with
Xcode 7.3.

# Usage

Many of these scripts work by looking at a branches tracking
information. Specifically, they are most useful when you have local
branches tracking other local branches.

For example, if you want to make a feature branch that tracks master,
you can run:

    $ git checkout --track -b feature master
    Branch feature set up to track local branch master.
    Switched to a new branch 'feature'

Now `git pull` will automatically merge in changes from master when
you are on your feature branch.

For many teams, uncommitted work needs to be rebased to the tip of the
destination branch. We can set this branch by branch:

    $ git config branch.feature.rebase true

But, its usually most convenient to set it up so that all branches
set-up to track local branches automatically rebase:

    $ git config --global branch.autoSetupRebase local

And its convenient to make all new branches automatically track the
branch they are based off:

    $ git config --global branch.autoSetupMerge always

Now if we make a new branch off our feature branch, it will
automatically be set up to rebase on pull:

    $ git checkout -b new-feature feature
    Branch new-feature set up to track local branch feature by rebasing.
    Switched to a new branch 'new-feature'

Now we have `new-feature` tracking `feature` tracking `master`
tracking `origin/master`. This is when these scripts get handy. For
instance, to see the stack of tracking branches, use `git stack`:

    $ git stack
    new-feature
    feature
    master
    origin/master

To checkout the upstream branch, use `git parent`:

    $ git parent
    Switched to branch 'feature'
    Your branch is up-to-date with 'master'.

To checkout the downstream branch again (assuming you only have one)
you can use `git child`:

    $ git child
    Switched to branch 'new-feature'
    Your branch is up-to-date with 'feature'.

Finally, the most important feature is being able to update the whole
stack in one command. This is what `git rpull` (recursive pull)
does. Normally to maintain a stack of these branches tracking each
other you would need to checkout each one and pull to bring it up to
date. This is exactly what `git rpull` does:

    $ git rpull
    # git fetch origin
    From gitlab.sd.apple.com:afalloon/git-helpers
       7a86921..400d340  master     -> origin/master
    # git checkout master
    Switched to branch 'master'
    Your branch is behind 'origin/master' by 1 commit, and can be fast-forwarded.
      (use "git pull" to update your local branch)
    # git merge origin/master
    Updating 7a86921..400d340
    Fast-forward
     git-child | 2 +-
     1 file changed, 1 insertion(+), 1 deletion(-)
    # git checkout feature
    Switched to branch 'feature'
    Your branch and 'master' have diverged,
    and have 1 and 1 different commits each, respectively.
      (use "git pull" to merge the remote branch into yours)
    # git rebase master
    First, rewinding head to replay your work on top of it...
    Applying: Allow commands to run in a subdir
    # git checkout new-feature
    Switched to branch 'new-feature'
    Your branch and 'feature' have diverged,
    and have 2 and 2 different commits each, respectively.
      (use "git pull" to merge the remote branch into yours)
    # git rebase feature
    First, rewinding head to replay your work on top of it...
    Applying: Update README with usage info

This makes it easy to continue working while your code might be going
through review or pre-commit testing. If any issues are found with one
of the upstream branches during review, you can checkout the
appropriate branch, amend the commit(s), go back to the downstream and
`git rpull` to bring the entire chain up to date.

If you want to bring all your working branches up to date at once, its
more efficient to run `git rpull-all` which will perform the
fetch/rebase steps only once per branch (essentially running `git
pull` on each branch in dependency order).

After rebasing, some branches may no longer have any changes if the
patch was merged to `master`. You can run `git prune-empty-branches`
to remove branches that have no changes from `master` (tracking
information for child branches are automatically updated).

Finally, if you are maintaining a number of outstanding
[gerrit](https://www.gerritcodereview.com) reviews, the command `git
gerrit-refresh` will push the branches that have open reviews.
