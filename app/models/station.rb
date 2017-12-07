class Station < ActiveRecord::Base

  validates_presence_of :name,
                        :dock_count,
                        :city,
                        :installation_date

  has_many :started_trips, :class_name => 'Trip', :foreign_key => 'start_station_id'
  has_many :ended_trips, :class_name => 'Trip', :foreign_key => 'end_station_id'

  def self.station_count
    count
  end

  def self.average_bikes_per_station
    average(:dock_count).to_i
  end

  def self.max_bikes_per_station
    maximum(:dock_count)
  end

  def self.station_with_most_bikes_available
    find_by(dock_count: maximum(:dock_count)).name
  end

  def self.min_bikes_at_station
    minimum(:dock_count)
  end

  def self.station_with_fewest_available
    find_by(dock_count: minimum(:dock_count)).name
  end

  def self.most_recent_station
    order(installation_date: :DESC).first.name
  end

  def self.oldest_station
    order(installation_date: :DESC).last.name
  end

  def number_rides_at_start_station
    started_trips.count
  end

  def number_rides_at_end_station
    ended_trips.count
  end

  def most_frequent_destination_station
    station_id = started_trips.group(:end_station_id).order("count_end_station_id desc").count(:end_station_id).first[0]
    Station.find(station_id).name
  end

  def most_frequent_origination_station
    station_id = ended_trips.group(:start_station_id).order("count_start_station_id desc").count(:start_station_id).first[0]
    Station.find(station_id).name
  end

  def date_with_highest_number_trips_started
    started_trips.group(:start_date).order(start_date: :desc).count.first[0].strftime("%Y-%m-%d")
  end

  def most_frequent_user_zipcode
    started_trips.group(:zip_code).order("count_zip_code desc").count(:zip_code).first[0]
  end

  def most_frequent_bike_id
    started_trips.group(:bike_id).order("count_bike_id desc").count(:bike_id).first[0]
  end

end
