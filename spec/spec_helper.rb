ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'bundler'
Bundler.require(:default, :test)


require 'capybara/dsl'
Capybara.app = BikeShareApp

RSpec.configure do |c|
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
  c.include Capybara::DSL
end
