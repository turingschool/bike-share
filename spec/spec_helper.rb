ENV["RACK_ENV"] ||= "test"

require 'bundler'
require 'capybara/dsl'
require 'rspec'
require 'database_cleaner'
require 'rack/test'
require File.expand_path("../../config/environment.rb", __FILE__)

Bundler.require(:default, :test)

Capybara.app             = BikeShareApp
DatabaseCleaner.strategy = :truncation

def app
  BikeShareApp
end

RSpec.configure do |c|

  c.before(:all) do
    DatabaseCleaner.clean
  end

  c.after(:each) do
    DatabaseCleaner.clean
  end

  c.include Rack::Test::Methods
  c.include Capybara::DSL
end
