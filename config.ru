require 'bundler'
Bundler.require

require File.expand_path('../config/environment',  __FILE__)

use StationsController
use TripsController
# use ConditionsController
run BikeShareApp
