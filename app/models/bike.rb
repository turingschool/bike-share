class Bike < ActiveRecord::Base
  has_many :trips

  def self.max_rides
    bikes = Trip.pluck(:bike_id)
    bike_ids = bikes.group_by{ |id| bikes.count(id)}.max.last.uniq
    Bike.find(bike_ids).map { |bike| bike.bike_number }
  end

  def self.min_rides
    bikes = Trip.pluck(:bike_id)
    bike_ids = bikes.group_by{ |id| bikes.count(id)}.min.last.uniq
    Bike.find(bike_ids).map { |bike| bike.bike_number }
  end

  

end
