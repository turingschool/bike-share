class Station < ActiveRecord::Base
  belongs_to :city
  has_many :beginning_trips, inverse_of: :start_station, class_name: "Trip", foreign_key: :start_station_id
  has_many :ending_trips, inverse_of: :end_station, class_name: "Trips", foreign_key: :end_station_id

  validates :name, presence: true, uniqueness: true
  validates :dock_count, presence: true
  validates :city, presence: true
  validates :installation_date, presence: true

  def self.average_bikes
    average(:dock_count).round
  end

  def self.most_bikes
    maximum(:dock_count)
  end

  def self.stations_by_most_docks
    docks = order(dock_count: :desc)
    derks = docks.group_by {|x| x.dock_count}
    results = derks.max_by {|x| derks.keys}
    results[1].map do |r|
      r.name
    end.join(', ')
  end

  def self.fewest_bikes
    minimum(:dock_count)
  end

  def self.stations_by_least_docks
    docks = order(:dock_count)
    derks = docks.group_by {|x| x.dock_count}
    results = derks.min_by {|x| derks.keys}
    results[1].map do |r|
      r.name
    end.join(', ')
  end

  def self.stations_by_install_date
    installs = order(installation_date: :desc)
    installs.select do |x|
      x
    end
  end

  def self.newest_station
    stations_by_install_date.first
  end

  def self.oldest_station
    stations_by_install_date.reverse.first
  end

  def arr_end_station_ids
    trips = Trip.started_at(id)
    end_station_ids = trips.map(&:end_station_id)
    binding.pry
    end_station_ids.group_by {|esi| end_station_ids.count(esi)}
    # paused here
  end

  def most_frequent_destinations
    arr_end_station_ids
    x = counts.select{ |key, value| value == counts.first[1] }
    destination_ids = x.keys
    destination_ids.map do |id|
      Station.find(id)
    end


  end

  # Use trip.rb methods:
  # def self.started_at(station)
  #   where(start_station_id: station)
  # end
  #
  # def self.ended_at(station)
  #   where(end_station_id: station)
  # end

end
