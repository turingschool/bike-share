class Station < ActiveRecord::Base
  has_many :trips_leaving, class_name: "Trip", foreign_key: "start_station_id"
  has_many :trips_arriving, class_name: "Trip", foreign_key: "end_station_id"

  validates_presence_of :name,
                        :dock_count,
                        :city,
                        :installation_date

  def self.average_bikes_per_station
    average(:dock_count).to_i
  end

  def self.most_bikes
    maximum(:dock_count)
  end

  def self.with_most_bikes
    where(dock_count: Station.most_bikes)
  end

  def self.fewest_bikes
    minimum(:dock_count)
  end

  def self.with_fewest_bikes
    where(dock_count: Station.fewest_bikes)
  end

  def self.newest_install_date
    maximum(:installation_date)
  end

  def self.newest_station
    where(installation_date: Station.newest_install_date)
  end

  def self.oldest_install_date
    minimum(:installation_date)
  end

  def self.oldest_station
    where(installation_date: Station.oldest_install_date)
  end

  def number_of_trips_started_at_station
    binding.pry
  end

end
