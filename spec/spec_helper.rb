ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'
require 'database_cleaner'


DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.clean
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end

Capybara.app = BikeShareApp

RSpec.configure do |c|
  c.include Capybara::DSL
end
