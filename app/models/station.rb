class Station < ActiveRecord::Base


  has_many :started_trips, class_name: "Trip", foreign_key: "start_station_id"
  has_many :ended_trips, class_name: "Trip", foreign_key: "end_station_id"

  validates :name, presence: true
  validates :dock_count, presence: true
  validates :city, presence: true
  validates :installation_date, presence: true

  def self.average_bikes
    Station.average("dock_count").round(2)
  end

  def self.most_bikes
    Station.maximum("dock_count")
  end

  def self.station_with_most_bikes
    Station.order("dock_count").last.name
  end

  def self.fewest_bikes
    Station.minimum("dock_count")
  end

  def self.station_with_fewest_bikes
    Station.order("dock_count").first.name
  end

  def self.most_recent_station
    Station.order("installation_date").last.name
  end

  def self.oldest_station
    Station.order("installation_date").first.name
  end

  def self.convert_csv_to_station_attributes
    a = Time.now
    stations = []
    CSV.foreach('db/csv/station.csv', {headers: true, header_converters: :symbol}) do |row|
      stations <<  Station.new(id:                row[:station_id],
                               name:              row[:name],
                               lat:               row[:lat],
                               long:              row[:long],
                               dock_count:        row[:dock_count],
                               city:              row[:city],
                               installation_date: Date.strptime(row[:installation_date], '%m/%e/%Y'))
    end
    b = Time.now
    puts "Creating the stations array took #{b - a} seconds"
    stations
  end

end
