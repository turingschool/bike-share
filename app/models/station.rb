class Station < ActiveRecord::Base
  belongs_to :city

  has_many :start_trips, class_name: 'Trip', foreign_key: :start_station_id
  has_many :end_trips, class_name: 'Trip', foreign_key: :end_station_id

  validates :name, presence: true, uniqueness: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true
  validates :city_id, presence: true

  def self.average_bikes_per_station
    average(:dock_count).round(2)
  end

  def self.max_bikes_available
    maximum(:dock_count)
  end

  def self.station_with_most_bikes
    where(dock_count: self.max_bikes_available).map {|station| station.name}.join(", ")
  end

  def self.fewest_bikes_available
    minimum(:dock_count)
  end

  def self.station_with_fewest_bikes
    where(dock_count: self.fewest_bikes_available).map {|station| station.name}.join(", ")
  end

  def self.newest_station
    find_by(installation_date: maximum(:installation_date)).name
  end

  def self.oldest_station
    find_by(installation_date: minimum(:installation_date)).name
  end

  def destination_counts
    start_trips.group(:end_station_id).count(:id)
  end
  
  def max_destination_station
    destination_counts.max_by{|k, v| v}.first
  end
  
  def frequent_destination
    Station.find(max_destination_station).name
  end

  def origination_counts
    end_trips.group(:start_station_id).count(:id)
  end
  
  def max_origination_station
    origination_counts.max_by{|k,v| v}.first
  end
  
  def frequent_origination
    Station.find(max_origination_station).name
  end

  def start_date_count
    start_trips.group(:start_date).count(:id)
  end
  
  def busiest_day
    start_date_count.max_by{|k,v| v}.first
  end
  
  def zip_code_counts
    start_trips.group(:zip_code).count(:id)
  end

  def max_zip_code_count
    zip_code_counts.max_by{|k,v| v}.first.zip_code
  end

  def bike_count
    start_trips.group(:bike_id).count(:id)
  end

  def max_bike_count
    bike_count.max_by{|k,v| v}.first
  end
      
  def most_frequent_bike
    Bike.find(max_bike_count).bike_number
  end
  

end
