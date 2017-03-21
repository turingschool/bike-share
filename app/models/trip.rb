class Trip < ActiveRecord::Base
    has_many :zipcodes

    belongs_to :start_station, class_name: 'Station', foreign_key: :start_station_id
    belongs_to :end_station, class_name: 'Station', foreign_key: :end_station_id

    # validates :duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type, presence: true

end
