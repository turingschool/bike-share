class Trip < ActiveRecord::Base
 belongs_to :start_station, class_name: 'Station', foreign_key: :start_station_id
 belongs_to :end_station, class_name: 'Station', foreign_key: :end_station_id

 belongs_to :bike
 belongs_to :zip_code
 belongs_to :subscription_type
 
 validates :duration, presence: true # , uniqueness: true
 validates :start_date, presence: true
 validates :start_station_id, presence: true
 validates :end_date, presence: true
 validates :end_station_id, presence: true
 validates :bike_id, presence: true
 validates :subscription_type_id, presence: true
 validates :zip_code_id, presence: true
end
