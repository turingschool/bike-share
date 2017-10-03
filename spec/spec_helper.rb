ENV["RACK_ENV"] ||= "test"

require 'bundler'
Bundler.require(:default, :test)

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'

Capybara.app             = BikeShareApp
DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.include Capybara::DSL
end
