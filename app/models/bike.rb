class Bike < ActiveRecord::Base
  has_many :trips


  def self.max_rides
    bikes = Trip.pluck(:bike_id)
    bike_ids = bikes.group_by{ |id| bikes.count(id)}.max.last.uniq
    Bike.find(bike_ids).map { |bike| bike.bike_number }
  end



#does not consider ties
  # def self.most_ridden_bike #which bike has the most trips?
  #   trip_bike_ids = Trip.all.map do |trip|
  #     trip.bike_id
  #   end
  #   Bike.find(trip_bike_ids.group_by(&:itself).values.max_by(&:size).first).bike_number
  # end

#does not condiser ties
#   def self.least_ridden_bike #which bike has the fewest trips?
#     bikes = all.map do |bike|
#       bike.id
#     end
#     Bike.find(bikes.group_by(&:itself).values.min_by(&:size).first).bike_number
#   end
#
# Bike.find(trip.bike_id).bike_number #will return an instance of Bike based on the bike_id in the Trip table
#
end
