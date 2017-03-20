require 'csv'
require './app/models/station'
require './app/models/city'
require './app/models/bike'
require './app/models/subscription_type'
require './app/models/trip'
require './app/models/zip_code'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

@count = 0
def clean_station(name)
  if Station.find_by(name: name) != nil
    Station.find_by(name: name).id
  else
    if name == 'Washington at Kearney'
      Station.find_by(name: 'Washington at Kearny').id
    elsif name == 'Post at Kearney'
      Station.find_by(name: 'Post at Kearny').id
    elsif name == 'Broadway at Main'
      Station.find_by(name: 'Stanford in Redwood City').id
    elsif name == 'San Jose Government Center'
      Station.find_by(name: 'Santa Clara County Civic Center').id
    end
  end
end

CSV.foreach "db/csv/station.csv", headers: true, header_converters: :symbol do |row|
    city = City.find_or_create_by(name: row[:city])

    Station.create(
        name:               row[:name],
        dock_count:         row[:dock_count],
        city_id:            city.id,
        installation_date:  row[:installation_date]
    )
end

CSV.foreach "db/csv/trip_fixture.csv", headers: true, header_converters: :symbol do |row|
    @count += 1
    bike = Bike.find_or_create_by(bike_number: row[:bike_id])
    subscription_type = SubscriptionType.find_or_create_by(subscription_type: row[:subscription_type])
    zip_code = ZipCode.find_or_create_by(zip_code: row[:zip_code])
    start_station = clean_station(row[:start_station_name])
    end_station = clean_station(row[:end_station_name])

    Trip.create(
      duration:             row[:duration],
      start_date:           row[:start_date],
      start_station_id:     start_station,
      end_date:             row[:end_date],
      end_station_id:       end_station,
      bike_id:              bike.id,
      zip_code_id:          zip_code.id,
      subscription_type_id: subscription_type.id
    )
    p "Creating Trip Number #{@count} with start station #{row[:start_station_name]} "
end
