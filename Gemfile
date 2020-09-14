source 'https://rubygems.org'
ruby '2.5.3'

gem 'travis'
gem 'rack'
gem 'sinatra'
gem 'activesupport'
gem 'pg', '>= 0.18', '< 2.0'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'tux'
gem 'shotgun'
gem 'rerun'
gem 'bootstrap', '~> 4.5.2'
gem 'pry'

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rspec'
  gem 'rack-test'
  gem 'simplecov'
end

group :production, :development, :test do
  gem 'rspec-rails', '~> 3.8'
  gem 'rake'
end
