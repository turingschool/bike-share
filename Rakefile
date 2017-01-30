require "bundler"
Bundler.require

require "sinatra/activerecord/rake"

namespace :db do
  desc "Import trips from a CSV file"
  task :import_trips => :environment do

    import_trip_csv
  end
  puts "Trips database imported"
end
