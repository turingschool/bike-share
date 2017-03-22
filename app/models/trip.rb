class Trip < ActiveRecord::Base
    has_many :zipcodes

    belongs_to :bike_id, class_name: 'Bike', foreign_key: :bike_id

    belongs_to :start_station, class_name: 'Station', foreign_key: :start_station_id
    belongs_to :end_station, class_name: 'Station', foreign_key: :end_station_id

    validates :duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, presence: true

    def self.average_duration_of_ride
      Trip.average(:duration).round
    end

    def self.longest_ride
      Trip.maximum(:duration)
    end

    def self.shortest_ride
      Trip.minimum(:duration)
    end


end
