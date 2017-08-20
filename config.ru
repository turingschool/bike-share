require 'bundler'
Bundler.require

require File.expand_path('../config/environment',  __FILE__)

use Rack::Static,
  :urls => ["/assets", "/js", "/css"],
  :root => "public"

# Heroku Stuff####
run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    }
  ]
}
###################

run BikeShareApp