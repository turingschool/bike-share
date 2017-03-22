class Trip < ActiveRecord::Base

  has_one :bike
  has_one :weather

  has_one :start_station, foreign_key: 'start_station_id', class_name: 'Station'
  has_one :end_station, foreign_key: 'end_station_id', class_name: 'Station'

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :subscription_type, presence: true

  def make_name
    date = start_date.strftime('%-m/%-d/%Y')
    start_name = Station.find(start_station_id).name
    end_name = Station.find(end_station_id).name
    "#{date}: #{start_name} -> #{end_name}"
  end
end

#add trip-dashboard methods and trip dashboard file later
