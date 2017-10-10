class Station < ActiveRecord::Base
  has_many :trips_started, class_name: "Trip", foreign_key: :start_station_id, dependent: :destroy
  has_many :trips_ended, class_name: "Trip", foreign_key: :end_station_id, dependent: :destroy

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

  def self.with_most_trips_started
    # get_id = group(:start_station_id).order(start_station_id: :desc).count(:start_station_id).first.id
  end

  def self.with_least_trips_started
  end
  #   select('count(trips_started)').joins(:trips)
  #
  #   select("songs.id, OTHER_ATTRS_YOU_NEED, count(listens.id) AS listens_count").
  #   joins(:listens).
  #   group("songs.id").
  #   order("listens_count DESC").
  #   limit(5)
  #
  #
  #
  # Station.select("station.id, count(trips_started.id) AS tsc")
  #   .joins(:trips_started)
  #   .group("station.id")
  #   .order("tsc DESC")
end
