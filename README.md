# kitahub
The kitahub web app.

# Prerequisites
On macOS use [Homebrew](http://brew.sh) to install the latest Ruby and PostgreSQL

``` shell
brew update
brew install ruby postgresql
brew link --overwrite ruby
```

Install [Docker for Mac](https://docs.docker.com/docker-for-mac/) to launch the database via docker-compose.

It is recommended to use editorconfig support in your text editor. Plugins can be found here: http://editorconfig.org/#download

# Usage
Get the source code

``` shell
git clone https://github.com/jehrhardt/kitahub.git
cd kitahub
```

Install the dependencies

``` shell
bundle install
```

Launch the databases in the background

``` shell
docker-compose up -d
```

Create the database and load the seed data

``` shell
bin/rails db:setup
```

Run the app

``` shell
bin/rails server
```

Open the app in your browser [localhost:3000](http://localhost:3000).

# Development
During development you should use the scripts in the `bin` directory.

To run the app during development

``` shell
bin/rails server
```

Run the tests

``` shell
bin/rails test
```
