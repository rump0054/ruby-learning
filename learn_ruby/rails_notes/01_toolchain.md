!SLIDE subsection

# Ruby on Rails Toolchain

# Why Git?

* Most Ruby and Rails developers use git
* Many open source components only accessible via git, from http://www.github.com
* Ecosystem of tools
* Modern Source Code Control
  * Permits decentralized development
  * Permits off-line development

# Git Cheat Sheet

* `git init` -- create a repo locally
* `git clone` -- copy a repo from a server
* `git status` -- what has changed
* `git log` -- history
* `git add` -- stage files for commit
* `git commit` -- commit staged files

<https://git.wiki.kernel.org/index.php/GitCheatSheet>
<http://help.github.com/git-cheat-sheets/>

!SLIDE
## The git development workflow

![Git workflow](images/git_workflow.png)

# Git Configuration

    git config --global user.name "Your Name"

    git config --global user.email mail@example.com

    git config --global --list

# RVM Gemsets

Groups gems in a "gemset"

Gems in different sets don't interfere with each other

Can maintain multiple sets of gems for different apps on same machine


    rvm use 1.9.2

    rvm gemset create rails3

    rvm gemset list_all

    rvm use 1.9.2@rails3

# RubyMine

* Commercial IDE
* Well integrated with open source tools
* Best of breed

## http://www.jetbrains.com/ruby/


# Ready, set, go...

    rvm gemset create rails3
    
    rvm gemset use rails3

    gem install rails --version 3.2.13
    
    rails -v      # should be 3.2.x

    rails new my_blog
    
    cd my_blog
    
    rails generate scaffold article title body:text published:boolean

    rake db:migrate
    
    rails server
    
    open http://localhost:3000/articles/
    
# Bundler

* Gemfile list all gems required for the app
* Can specify explicit versions
* Gemfile.lock is complete version manifest
* Works well with RVM, using project-specific .rvmrc file
* In .rvmrc file: `rvm use 1.9.2@rails3`

# `rails s[erver]`

# SSH Key Setup (Linux)

Be sure you have the open-ssh package installed. Check with:

    which ssh  # should return something like `/usr/bin/ssh`

If you have files `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub` you're done. Otherwise, run:

    ssh-keygen -t rsa -C "your_email@youremail.com"

More help:
<http://help.github.com/linux-set-up-git/>

# Heroku

* Simple cloud hosting for Rails
* Single-command deployment, no setup.
* Sign-up for free account: heroku.com
* Free for single dyno (single thread) of web server

# Heroku + Rails gotchas

* install "Heroku Toolbelt" for command-line `heroku` app
* remember to run `heroku run rake db:migrate`
* decide whether to precompile & check in your `public/assets` directory
  * if you do, then your app is bloated & you might forget next time
  * if you don't, then Heroku does it for you, but your deploys will take longer & might fail
* you must *include* `pg` and *exclude* `sqlite3` in your `Gemfile`'s `:production` group

