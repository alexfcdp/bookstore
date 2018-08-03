# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'activeadmin'
gem 'bootsnap', require: false
gem 'cancan'
gem 'carrierwave'
gem 'coffee-rails'
gem 'devise'
gem 'jbuilder'
gem 'kaminari'
gem 'mini_magick'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'pg'
gem 'puma'
gem 'rails'
gem 'rubocop'
gem 'sass-rails'
gem 'turbolinks'
gem 'uglifier'
gem "aws-sdk-s3", require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'ffaker'
  gem 'shoulda-matchers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
