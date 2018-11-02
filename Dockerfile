FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        nodejs \
        supervisor \
        inotify-tools
RUN mkdir /customer_support_center
WORKDIR /customer_support_center
COPY Gemfile /customer_support_center/Gemfile
COPY Gemfile.lock /customer_support_center/Gemfile.lock
RUN bundle install
COPY . /customer_support_center