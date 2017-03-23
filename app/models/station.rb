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

  def all_trips_starting_at_id
    Trip.started_at(id)
  end

  def ending_ids
    all_trips_starting_at_id.map {|trip| trip.end_station_id}
  end

  def self.all_trips
    Trip.all
  end

  def self.all_trips_date
    all_trips.map {|trip| trip.start_date}
  end

  def self.date_with_highest_number_of_trips
    hash = all_trips_date.group_by {|date| all_trips_date.count(date)}
    hash.max_by {|key, value| key}[1].uniq
  end

  def sorted_destination
    trips = Trip.where(start_station_id: id)
    trips.each_with_object(Hash.new(0)) { |trip, counts| counts[trip.id] += 1 }
  end

  def count_per_attribute(obj_attribute)
    obj_attribute.group_by {|att| obj_attribute.count(att)}
  end

  def get_highest_uniq_ids
    hash = count_per_attribute(ending_ids)
    hash_to_max_arr(hash)
  end

  def get_lowest_uniq_ids
    hash = count_per_attribute(ending_ids)
    hash.min_by {|key, value| key}[1].uniq
  end

  def find_highest_station_objects
    get_highest_uniq_ids.map {|id| Station.find(id)}
  end

  def find_lowest_station_objects
    get_lowest_uniq_ids.map {|id| Station.find(id)}
  end

  def starting_date_arr
    all_trips_starting_at_id.map {|trip| trip.start_date}
  end

  def busiest_day
    hash = count_per_attribute(starting_date_arr)
    hash_to_max_arr(hash)
  end

  def zip_code_arr
    all_trips_starting_at_id.map {|trip| trip.zip_code}
  end


  def most_frequent_zip
    hash = count_per_attribute(zip_code_arr)
    hash_to_max_arr(hash)
  end

  def bike_id_arr
    all_trips_starting_at_id.map {|trip| trip.bike_id}
  end

  def most_used_bike
    hash = count_per_attribute(bike_id_arr)
    hash_to_max_arr(hash)
  end

  def hash_to_max_arr(hash)
    hash.max_by {|key, value| key}[1].uniq
  end
end
