require "bundler"
Bundler.require

require "sinatra/activerecord/rake"

namespace :db do
  desc "Import station from a CSV file"
  task :import_stations => :environment do

    import_station_csv
  end
  puts "Stations database imported"
end
