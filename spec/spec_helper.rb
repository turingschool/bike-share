ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'
require 'database_cleanser'

DatabaseCleanser.strategy = :truncation

Capybara.app = BikeShareApp

RSpec.configure do |c|
  c.before(:all) do
    DatabaseCleanser.clean
  end
  c.after(:each) do
    DatabaseCleanser.clean
  end
  c.include Capybara::DSL
end
