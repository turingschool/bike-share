require 'bundler'
Bundler.require

%w(will_paginate will_paginate/active_record).each {|lib| require lib}

require File.expand_path('../config/environment',  __FILE__)

run BikeShareApp
