require 'coveralls'
Coveralls.wear!('rails')
require 'simplecov'
SimpleCov.start

ENV['RACK_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec'
require 'rack/test'
require 'capybara/dsl'
require 'database_cleaner'

Capybara.app = SinatraWebsite

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.include Capybara::DSL

  config.before(:all) do
    DatabaseCleaner.clean
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
