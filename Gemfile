# source 'https://rubygems.org'
# source 'https://gems.ruby-china.org'
source 'https://gems.ruby-china.com'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# A Ruby gem to load environment variables from `.env`.
gem 'dotenv-rails'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Use jquery as the JavaScript library
# gem 'jquery-rails'
# bootstrap-sass is a Sass-powered version of Bootstrap 3, ready to drop right into your Sass powered applications
# gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
# gem 'font-awesome-sass', '~> 4.7.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
gem 'redis-namespace'
# This gem provides a Rubyish interface to Redis, by mapping Redis data types to Ruby objects, via a thin layer over the redis gem. It offers several advantages over the lower-level redis-rb API
gem 'redis-objects'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'gentelella-rails', github: 'mwlang/gentelella-rails'
gem 'modernizr-rails'
# paginate
gem 'kaminari'
# parse xml html
gem 'nokogiri'
# form
gem 'simple_form'
# Dynamic nested forms using jQuery made easy; works with formtastic, simple_form or default forms
gem 'cocoon'
# simple and extremely flexible way to upload files
gem 'carrierwave'
# carrierwave extension to use ffmpeg to transcode videos to html5-friendly format
gem 'carrierwave-video'
gem 'carrierwave-i18n'
# A ruby wrapper for ImageMagick or GraphicsMagick command line.
gem "mini_magick"
# elasticsearch
gem 'searchkick'
# a clear syntax for writing and deploying cron jobs
gem 'whenever'
# deal excel
gem 'spreadsheet'
# a set of notifiers for sending notifications when errors occur in a Rack/Rails
# gem 'exception_notification'
# Tracking ⚠️ exceptions for Rails application and store them in database.
gem 'exception-track', github: 'gh12128/exception-track'
# Awesome Print is a Ruby library that pretty prints Ruby objects in full color exposing their internal structure with proper indentation
gem "awesome_print"
# Devise is a flexible authentication solution for Rails based on Warden
gem 'devise'
# Ancestry is a gem that allows the records of a Ruby on Rails ActiveRecord model to be organised as a tree structure
# https://github.com/stefankroes/ancestry/wiki/Creating-a-selectbox-for-a-form-using-ancestry
gem 'ancestry'
# back up database ...
gem 'backup'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Audited (formerly acts_as_audited) is an ORM extension that logs all changes to your Rails models.
gem "audited", "~> 4.7"
# province,city,district select
gem 'china_city'
# an implementation of the nested set pattern for ActiveRecord models
gem 'awesome_nested_set'
# Minimal authorization through OO design and pure Ruby classes
gem 'pundit'
# Background jobs
gem 'sidekiq', '~> 5.0'
gem 'sidekiq-cron', github: 'ondrejbartas/sidekiq-cron'
gem 'sidekiq-limit_fetch'
gem 'sinatra', require: false
# A super fast, efficiently stored Trie for Ruby. Uses libdatrie.
gem 'fast_trie', require: "trie"
# # OmniAuth is a flexible authentication system utilizing Rack middleware. https://omniauth.io
# gem 'omniauth'
# # An abstract OAuth2 strategy for OmniAuth.
# gem 'omniauth-oauth2'
# Captcha gem for Rails Application. No dependencies. No ImageMagick, No RMagick. http://huacnlee.com/rucaptcha
gem 'rucaptcha'
# High performance memcached client for Ruby。 for gem 'rucaptcha'
gem 'dalli'
# :shipit: Twitter emoji in Ruby 😊 https://github.com/jollygoodcode/twemoji
gem "twemoji"
# Ckeditor integration gem for rails http://ckeditor.com/
gem 'ckeditor'
# Helper for add social share feature in your Rails app. Twitter, Facebook, Weibo, Douban ...
gem 'social-share-button'
# Simple, but flexible HTTP client library, with support for multiple backends.
gem 'faraday'
# Create beautiful JavaScript charts with one line of Ruby https://www.chartkick.com
gem "chartkick"
# The simplest way to group temporal data
gem 'groupdate'
# Simple pub/sub messaging for the web
gem "faye"
gem "thin"
