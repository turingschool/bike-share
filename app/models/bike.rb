class Bike < ActiveRecord::Base
    has_many :trips



    def self.most_ridden_bike_and_total_rides

      Trip.where(bike_id: (Bike.all.max_by{|bike| bike.trips.count})).count
    end

    def self.least_ridden_bike_and_total_rides

      Trip.where(bike_id: (Bike.all.min_by{|bike| bike.trips.count})).count
    end

end
