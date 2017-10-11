ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'rack/test'
require 'bundler'
Bundler.require(:default, :test)

require 'capybara/dsl'
Capybara.app = BikeShareApp
Capybara.save_path = 'tmp/capybara'

DatabaseCleaner.strategy = :truncation

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

def app
  BikeShareApp.new  
end
