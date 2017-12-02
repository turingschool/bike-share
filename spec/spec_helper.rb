ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'
require 'database_cleaner'
require 'date'

Capybara.app = BikeShareApp
Capybara.save_and_open_page_path = 'tmp/capybara'

RSpec.configure do |c|
  c.include Capybara::DSL
end

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
   config.before(:each) do
     DatabaseCleaner.start
   end

   config.append_after(:each) do
    DatabaseCleaner.clean
  end
end
