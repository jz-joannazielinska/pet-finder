# Ruby on Rails Pet Finder learning app


This project is backend part of Ruby-React app created for programming learning purposes. 
Feel free to be a part of it, and make your own Merge Requests.


# Installation process

**Things you might want to cover to run project locally**

To get things work you need to clone this repo by using `git clone git@gitlab.com:Pet-Finder-App/pet-finder-backend-repo.git`

* If Ruby is not on your computer please follow [this](https://www.ruby-lang.org/en/documentation/installation/) guide.

* You will need Ruby version: RVM ruby '2.6.5'

* Rails version: '6.0.0'

* Database type: Postgres

* Some system dependencies (recommended unix-based systems), and code editor (f.e. [RubyMine](https://www.jetbrains.com/help/ruby/installation-guide.html))


# Configuration

**Install Ruby**

You may already have Ruby installed on your computer. You can check it inside a terminal by typing:


```cassandraql
$ rvm v
```

This should return version of Ruby if it is installed. If not, please follow:

```
$ ruby-install ruby

# or you can define ruby version:
$ ruby-install ruby 2.6.5
```

or install with [install RVM](https://rvm.io/rvm/install) (recommended)

```
$ rvm install "ruby-2.6.5"
```

**Install Rails**

Rails version is listed in `gemfile.rb` file inside project. You can check which version you are using by typing in terminal:

```
rails -v
```

## DATABASE
You may already have Posgres installed on your computer. How version you are using check with command:
```
$ postgres --version
```
### Install database tools:
#### 1) Install Homebrew

```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
#### 2) Update Homebrew
Before you install anything with Homebrew, you should always make sure it's up to date and that it's healthy:
```
$ brew update
$ brew doctor
```
#### 3)Install Postgres
```
$ brew install postgresql
```
#### 4) Create/Upgrade a database
If this is your first time installing Postgres with Homebrew, you'll need to create a database with:
```
$ initdb /usr/local/var/postgres -E utf8
```
#### 5) Start Postgres
**To start manually:**
```
$ pg_ctl -D /usr/local/var/postgres start
```
**To stop manually:**
```
$ pg_ctl -D /usr/local/var/postgres stop
```

**To start PostgreSQL server now and relaunch at login:**
```
$ brew services start postgresql
$ psql postgres
```
**And stop PostgreSQL:**
```
brew services stop postgresql
```
### Install JavaScript tools:
```
$ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
$ echo ‘deb https://dl.yarnpkg.com/debian/ stable main’ | sudo tee /etc/apt/sources.list.d/yarn.list
$ sudo apt update && sudo apt install yarn
$ rails webpacker:install
```
Make sure all packages are up to date using the following command.
```
$ yarn install --check-files
```
Now start your rails server once again and it should not throw an error.

```
$ rails sever
```

### Database creation:

#### 1) Create database.yml from demo_database.yml file. 
You should fill user name in development section. Password could be empty. It depends on your setup.
#### 2) Create file option.yml and copy and paste it from Master on Github.
#### 3) In Database panel in RubyMine you click on "+" icon and add New database.
> * database name: evelopment@localhost
> * host: localhost
> * user: foo
> * port: 5432
> * url: is generated automatically 
#### 4) Create database:
```
$ rails db:create
```
#### 5) Next, migrate it:
```
$ rails db:migrate
```
#### 5) then seed it:
```
$ rake db:seed
$ rake db:dev_seed
```
### Database initialization:
Note to Error FATAL: role "postgres" does not exist (PG::ConnectionBad) Traceback (most recent call last):
You can resolve it with Refresh database (click on Recycle icon).


### CI/CD with Auto DevOps

It is not used yet.





This template is compatible with [Auto DevOps](https://docs.gitlab.com/ee/topics/autodevops/).

If Auto DevOps is not already enabled for this project, you can [turn it on](https://docs.gitlab.com/ee/topics/autodevops/#enabling-auto-devops) in the project settings.
