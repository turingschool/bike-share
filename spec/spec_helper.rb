ENV["RACK_ENV"] ||= "test"

require 'bundler'
Bundler.require(:default, :test)
require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'
require 'factory_girl'
require 'shoulda-matchers'

Capybara.app = BikeShareApp

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.include Capybara::DSL
  c.include FactoryGirl::Syntax::Methods
  c.include(Shoulda::Matchers::ActiveModel, type: :model)
  c.include(Shoulda::Matchers::ActiveRecord, type: :model)
  c.before(:suite) do
    FactoryGirl.find_definitions
  end

  c.before(:all) do
    DatabaseCleaner.clean
  end

  c.after(:each) do
    DatabaseCleaner.clean
  end
end
