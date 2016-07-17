FROM ruby:2.2.5

# Install requirements
RUN apt-get update -qq && apt-get install -y libpq-dev nodejs

# Setup a directory for the kitahub code
RUN mkdir /kitahub
WORKDIR /kitahub

# Install dependencies
ADD Gemfile /kitahub/Gemfile
ADD Gemfile.lock /kitahub/Gemfile.lock
RUN bundle install

# Make kitahub available from outside
EXPOSE 3000
