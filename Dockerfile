FROM ruby:2.5

MAINTAINER Geovane Pacheco <geovane.pacheco99@gmail.com>

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential postgresql-client libpq-dev nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY Gemfile .

COPY Gemfile.lock .

RUN bundle install

COPY . .

# ENV PATH $PATH:/usr/lib/pgsql/bin
#
# ENV PATH $PATH:/usr/lib/postgresql/10/bin

EXPOSE 3000
