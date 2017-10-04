ENV["RACK_ENV"] ||= "test"

require "./config/environment"
require 'bundler'
require 'database_cleaner'
require 'capybara/rspec'
require 'capybara/dsl'
require 'rspec'

Bundler.require(:default, :test)
DatabaseCleaner.strategy = :truncation
Capybara.app = BikeShareApp
RSpec.configure do |c|
  c.include Capybara::DSL
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end
