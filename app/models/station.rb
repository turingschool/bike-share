class Station < ActiveRecord::Base
  belongs_to :city
  has_one :start_station
  has_one :end_station

  validates :name, presence: true
  validates :city_id, presence: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true

  def update_city_id(city_name, station)
    city = City.find_by name: city_name
    station.update city_id: city.id
  end

  def self.data_analysis(station_id)
    {rides_started_at_station: Station.rides_started_at_station(station_id),
    rides_ended_at_station: Station.rides_ended_at_station(station_id),
    most_frequent_destination_station: Station.most_frequent_destination_station(station_id),
    most_frequent_origination_station: Station.most_frequent_origination_station(station_id)


    }
  end

  def self.rides_started_at_station(station_id)
    if Station.find(station_id).start_station.nil?
      rides = 0
    else
      rides = Station.find(station_id).start_station.trips.count
    end
  end

  def self.rides_ended_at_station(station_id)
    if Station.find(station_id).end_station.nil?
      rides = 0
    else
      rides = Station.find(station_id).end_station.trips.count
    end
  end

  def self.most_frequent_destination_station(station_id)
    if Station.find(station_id).end_station.nil?
      "No rides have begun at this station"
    else
      end_station_id = Station.find(station_id).start_station.trips.group(:end_station_id).order('count_id asc').count('id').keys.last
    end
      EndStation.find(end_station_id).station.name
  end

  def self.most_frequent_origination_station(station_id)
    if Station.find(station_id).start_station.nil?
      "No rides have ended at this station"
    else
      start_station_id = Station.find(station_id).end_station.trips.group(:start_station_id).order('count_id asc').count('id').keys.last
    end
    StartStation.find(start_station_id).station.name
  end

  def self.dashboard_analysis
    {count: Station.all.count


    }
  end


end
