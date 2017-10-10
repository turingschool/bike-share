class Station < ActiveRecord::Base
  has_many :trips_started, class_name: "Trip", foreign_key: :start_station_id
  has_many :trips_ended, class_name: "Trip", foreign_key: :end_station_id

  validates_presence_of :name,
                        :dock_count,
                        :city,
                        :installation_date,
                        :lat,
                        :long

  def self.names
    all.map(&:name).join(', ')
  end

  def self.with_most_bikes
    where dock_count: maximum(:dock_count)
  end

  def self.with_least_bikes
    where dock_count: minimum(:dock_count)
  end

  def self.newest
    where installation_date: maximum(:installation_date)
  end

  def self.oldest
    where installation_date: minimum(:installation_date)
  end

  def self.average_dock_count
    average(:dock_count)
  end

  def self.maximum_dock_count
    maximum(:dock_count)
  end

  def self.minimum_dock_count
    minimum(:dock_count)
  end

  def started_rides_count
    trips_started.count
  end

  def ended_rides_count
    trips_ended.count
  end

  def frequent_destination
    station = trips_started.group("end_station_id").order("count_id DESC").count(:id).first[0]
    # Trip.find(id:station)
  end
end
