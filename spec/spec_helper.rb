ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require './db/loader'

require 'rspec'
require 'capybara/dsl'
require 'database_cleaner'
require 'pry'

DatabaseCleaner.strategy = :truncation

Capybara.app = BikeShareApp
Capybara.save_path = './db/temp'

RSpec.configure do |c|
  c.include Capybara::DSL

  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end