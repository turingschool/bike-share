ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'bundler'
require 'capybara/dsl'
require 'capybara/rspec'
require 'database_cleaner'

Bundler.require(:default, :test)
Capybara.app = BikeShareApp
DatabaseCleaner.strategy = :truncation
RSpec.configure do |c|
  c.include Capybara::DSL
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end
