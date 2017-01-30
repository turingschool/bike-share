require "bundler"
Bundler.require

require "sinatra/activerecord/rake"

namespace :db do
  require_relative "db/seeds"
  desc "Import trips from a CSV file"
  task :import_trips_csv => :environment do
    import_trip_csv
  end

  desc "Import stations from a CSV file"
    task :import_stations_csv => :environment do
    import_stations_csv
  end

  desc "Import conditions from a CSV file"
  task :import_conditions_csv => :environment do
    import_conditions_csv
  end
end
