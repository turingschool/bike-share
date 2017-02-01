class Bike < ActiveRecord::Base

  has_many :trips

  def self.most_ridden_bike_with_total_rides_for_bike
    # Bike.min_by("bike_id").count
  end

  def self.most_ridden_bike_with_total_rides_for_bike
    # min_by("bike_id").count
  end

end
