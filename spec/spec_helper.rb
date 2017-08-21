ENV["RACK_ENV"] ||= "test"

require 'bundler'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'

Bundler.require(:default, :test)

Capybara.app = BikeShareApp
Capybara.save_and_open_page_path = 'tmp/capybara'

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.include Capybara::DSL

  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end
