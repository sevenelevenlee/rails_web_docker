
FROM ruby:2.5.0
MAINTAINER gh gh@sywh.com

# 安装必要套件
 RUN apt-get update
 RUN apt-get install -y build-essential
 RUN apt-get install -y ffmpeg libssl-dev libpq-dev libxml2-dev libxslt1-dev nodejs git imagemagick libbz2-dev libjpeg-dev libevent-dev libmagickcore-dev libffi-dev libglib2.0-dev zlib1g-dev libyaml-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV APP_HOME /app

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile $APP_HOME/
COPY Gemfile.lock $APP_HOME/


RUN gem install bundler
RUN bundle install
COPY . .

# RUN bundle exec rake db:setup

COPY . $APP_HOME

# RUN bundle exec rake assets:precompile RAILS_ENV=production
 RUN bundle exec rake RAILS_ENV=$RAILS_ENV assets:precompile

# EXPOSE 8080
# EXPOSE 3050
# CMD ["bundle", "exec", "puma", "-C", "config/puma_docker.rb"]
