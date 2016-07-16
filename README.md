# kitahub
The kitahub app.

# Prerequisites
For local development Docker and and docker-compose are required. To install them on MacOS Docker for Mac is recommended. You can download it from here: https://docs.docker.com/docker-for-mac/

# Usage
Get the source code

``` shell
git clone https://github.com/jehrhardt/kitahub.git
cd kitahub
```

Build your environment

``` shell
docker-compose build
```

Run the database

``` shell
docker-compose up -d db
```

Run the app

``` shell
docker-compose up app
```

Open the app in your browser [localhost:3000](http://localhost:3000).
