class Bike < ActiveRecord::Base
    has_many :trips

    def self.most_ridden_bike_and_total_rides
      Bike.all.max_by {|bike| bike.bike_id.count}

    end

end
