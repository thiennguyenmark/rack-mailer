# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sidekiq'
gem 'actionmailer'
gem 'pg'

group :test do
  gem 'rspec'
end

group :test, :development do
  gem 'byebug'
end
