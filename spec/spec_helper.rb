ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'
require 'database_cleaner'


Capybara.app = BikeShareApp
DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.include Capybara::DSL
  c.before(:all) { DatabaseCleaner.clean }
  c.after(:all) { DatabaseCleaner.clean }
end
