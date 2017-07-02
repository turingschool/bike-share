ENV["RACK_ENV"] ||= "test"

require 'bundler'
require 'rspec'
require 'capybara/dsl'
Bundler.require(:default, :test)
require File.expand_path("../../config/environment", __FILE__)

Capybara.app = BikeShareApp
Capybara.save_and_open_page_path = 'tmp/capybara'

# RSpec.configure do |c|
#   c.include Capybara::DSL
# end

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
  c.include Capybara::DSL
end
