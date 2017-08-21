class Trip < ActiveRecord::Base

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station_name, presence: true
  validates :start_station_id, presence: true
  validates :end_date, presence: true
  validates :end_station_name, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true

  def self.convert_csv_to_trip_attributes
    a = Time.now
    trips = []
    CSV.foreach("db/csv/trip_fixture.csv", {headers: true, header_converters: :symbol}) do |row|
      trips << Trip.new(duration:            row[:duration],
                        start_date:          Date.strptime(row[:start_date], '%m/%e/%Y'),
                        start_station_name:  row[:start_station_name],
                        start_station_id:    row[:start_station_id],
                        end_date:            Date.strptime(row[:end_date], '%m/%e/%Y'),
                        end_station_name:    row[:end_station_name],
                        end_station_id:      row[:end_station_id],
                        bike_id:             row[:bike_id],
                        subscription_type:   row[:subscription_type],
                        zip_code:            row[:zip_code])
    end
    b = Time.now
    puts "Creating the trips array took #{b - a} seconds"
    trips
  end
end
