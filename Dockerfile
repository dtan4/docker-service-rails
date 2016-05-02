FROM ruby:2.3.1-slim
MAINTAINER Daisuke Fujita <dtanshi45@gmail.com> (@dtan4)

RUN apt-get update && \
    apt-get install -y build-essential zlib1g-dev libpq-dev nodejs && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY Gemfile /app/
COPY Gemfile.lock /app/

RUN bundle install -j4 --without development test

COPY . /app

EXPOSE 3000

ENTRYPOINT ["/app/script/entrypoint.sh"]
CMD ["bin/rails", "s"]
