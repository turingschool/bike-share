class Trip < ActiveRecord::Base

  belongs_to :bike
  belongs_to :weather_condition

  belongs_to :start_station, foreign_key: 'start_station_id', class_name: 'Station'
  belongs_to :end_station, foreign_key: 'end_station_id', class_name: 'Station'

  validates :duration, presence: true
  validates :start_date, presence: true, uniqueness: { scope: :start_station, scope: :bike }
  validates :end_date, presence: true
  validates :subscription_type, presence: true

  def make_name
    date = start_date.strftime('%-m/%-d/%Y')
    start_name = Station.find(start_station_id).name
    end_name = Station.find(end_station_id).name
    "#{date}: #{start_name} -> #{end_name}"
  end

  def self.average_duration
    Trip.average(:duration).to_i
  end
end

#add trip-dashboard methods and trip dashboard file later
