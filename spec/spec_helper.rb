ENV["RACK_ENV"] ||= "test"

require 'bundler'
Bundler.require(:default, :test)
require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'
require 'factory_girl'
require 'shoulda-matchers'

Capybara.app = BikeShareApp

RSpec.configure do |c|
  c.include Capybara::DSL
  c.include FactoryGirl::Syntax::Methods
  c.include(Shoulda::Matchers::ActiveModel, type: :model)
  c.include(Shoulda::Matchers::ActiveRecord, type: :model)
  c.before(:suite) do
    FactoryGirl.find_definitions
  end
end
