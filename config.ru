require 'bundler'
Bundler.require

require File.expand_path('../config/environment',  __FILE__)

require File.expand_path './app/controllers/bike_share_app.rb', File.dirname(__FILE__)

run BikeShareApp