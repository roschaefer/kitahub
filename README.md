# kitahub
The kitahub app.

# Prerequisites
On macOS use [Homebrew](http://brew.sh) to install the latest Ruby and PostgreSQL

``` shell
brew update
brew install ruby postgresql
brew services start postgresql
```

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

Create and migrate the database

``` shell
bin/rails db:setup
bin/rails db:migrate
```

Run the app

``` shell
bin/rails server
```

Open the app in your browser [localhost:3000](http://localhost:3000).
