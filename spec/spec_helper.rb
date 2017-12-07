ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'bundler'
Bundler.require(:default, :test)
require 'rspec'
require 'capybara/dsl'
DatabaseCleaner.strategy = :truncation
require 'pry'
require 'date'

Capybara.app = BikeShareApp
Capybara.save_and_open_page_path = 'tmp/capybara'

RSpec.configure do |c|
  c.include Capybara::DSL
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end
