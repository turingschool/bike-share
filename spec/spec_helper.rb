ENV["RACK_ENV"] ||= "test"

require 'bundler'
Bundler.require(:default, :test)
require File.expand_path("../../config/environment", __FILE__)
require 'capybara/dsl'
require 'capybara/rspec'
require 'database_cleaner'
require './db/seed'

Capybara.app = BikeShareApp
DatabaseCleaner.strategy = :truncation
RSpec.configure do |c|
  c.include Capybara::DSL
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.before do
    Seed.start
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end
