ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'pry'
require 'bundler'
Bundler.require(:default, :test)
require 'rspec'
require 'capybara/dsl'
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
