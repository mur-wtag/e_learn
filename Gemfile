# frozen_string_literal: true

source 'https://rubygems.org'

gem 'rails', '~> 6.1.1'
gem 'rack'

# Authorization
gem 'cancancan'

# DB
gem 'pg'
gem 'pg_search'
gem 'pghero'
gem 'pg_query'

# Authentication
gem 'devise'
gem 'jwt'
gem 'rack-cors'

# Other backend gems
gem 'jbuilder', '~> 2.0'
gem 'bootsnap', require: false

group :development do
  gem 'foreman'
  gem 'puma'
  gem 'rubocop'
end

group :development, :test do
  gem 'byebug'
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'guard-rspec', require: false
  gem 'guard-process', require: false
  gem 'rails-controller-testing'
  gem 'rspec-rails'
end