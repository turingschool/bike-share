class Station < ActiveRecord::Base
  validates_presence_of :name, :city, :dock_count, :installation_date_id
  belongs_to :installation_date, class_name: "BikeShareDate", foreign_key: "installation_date_id"
  has_many :start_trips, class_name: "Trip", foreign_key: "start_station_id"
  has_many :end_trips, class_name: "Trip", foreign_key: "end_station_id"

  def self.id_by_name(name)
    name = "Stanford in Redwood City" if name == "Broadway at Main"
    name = "Santa Clara County Civic Center" if name == "San Jose Government Center"
    name = "Post at Kearney" if name == "Post at Kearny"
    name = "Washington at Kearney" if name == "Washington at Kearny"
    find_by(name: name).id
  end

  def self.total_count
    Station.count
  end

  def self.most_number_of_available_bikes
    Station.pluck(:dock_count).max
  end

  def self.least_number_of_available_bikes
    Station.pluck(:dock_count).min
  end

  def self.oldest_station
    Station.includes(:installation_date).order('bike_share_dates.date').first
  end

  def self.station_with_most_bikes
    most_bikes = Station.maximum(:dock_count)
    Station.where(dock_count: most_bikes)
  end

  def self.average_bikes_available_per_station
    average(:dock_count).round
  end

  def self.most_recently_installed
    Station.includes(:installation_date).order('bike_share_dates.date').last
  end

  def self.stations_with_fewest_bikes_available
    station = Station.minimum(:dock_count)
    Station.where(dock_count: station)
  end

  def most_trip_date
    all_start_trips = start_trips.group(:start_date_id).count
    highest_start_date = all_start_trips.max_by { |k,v| v }
    if highest_start_date.nil?
      return "0"
    else
      return BikeShareDate.find(highest_start_date.first).date.strftime('%B %d, %Y')
    end
  end

  def start_station_with_most_rides
    all_destinations = start_trips.group(:end_station_id).count
    most_destination = all_destinations.max_by { |k,v| v }
    if most_destination.nil?
      return "0"
    else
      return Station.find(most_destination.first).name
    end
  end

  def origination_station
    all_origins = end_trips.group(:start_station_id).count
    most_origin = all_origins.max_by { |k,v| v }
    if most_origin.nil?
      return "0"
    else
      return Station.find(most_origin.first).name
    end
  end

  def starting_bike_id
    bike_ids = start_trips.group(:bike_id).count
    bike = bike_ids.max_by { |k,v| v }
    if bike.nil?
      return "n/a"
    else
      return bike.first
    end
  end

  def most_frequent_zipcode
    zipcode_ids = start_trips.group(:zipcode_id).count
    zipcode = zipcode_ids.max_by { |k,v| v }
    if zipcode.nil?
      return "n/a"
    else
      return Zipcode.find(zipcode.first).zipcode
    end
  end
end
