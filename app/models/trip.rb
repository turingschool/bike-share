class Trip < ActiveRecord::Base

  acts_as_copy_target #this is from the postgres-copy gem

  def self.avg_duration_of_a_ride
    average(:duration)
  end

  def self.longest_ride
    maximum(:duration)
  end

  def self.shortest_ride
    minimum(:duration)
  end

  def self.station_with_most_ride_starts
    trip = Trip.group(:start_station_id).order('count_id DESC').limit(1).count(:id).first[0]
    Station.find(trip)[:name]
  end

  def self.station_with_most_rides_ends
    trip = Trip.group(:end_station_id).order('count_id DESC').limit(1).count(:id).first[0]
    Station.find(trip)[:name]
  end

  def month_breakdown
    Trip.group('(EXTRACT(YEAR FROM end_date))::integer').group('(EXTRACT(MONTH FROM end_date))::integer').order('count_all DESC').count
  end

  def self.most_ridden_bike
    group_by(:bike_id).order('bike_id DESC').count(:id)
  end

  def least_ridden_bike
    Trip.group(:bike_id).order('count_id DESC').limit(1).count(:id).first.first
  end

  def subscription_type
  end

  def date_with_highest_trips
  end

  def date_with_fewest_trips
  end



end
