# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.5.1'

group :test do
  gem 'rspec'
end

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'rubocop', require: false
  gem 'terminal-notifier-guard', '~> 1.6.1'
  gem 'terminal-notifier'
end

group :development, :test do
  gem 'pry'
end
