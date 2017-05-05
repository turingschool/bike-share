ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'

require_relative '../../app/models/csv_reader'

Capybara.app = BikeShareApp

RSpec.configure do |c|
  c.include Capybara::DSL
end
