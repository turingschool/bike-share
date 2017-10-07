class Trip < ActiveRecord::Base

	def self.avg_duration
    time = average(:duration)
    Time.at(time).utc.strftime("%H:%M:%S")
  end

  def self.longest_ride
    time = maximum(:duration)
    Time.at(time).utc.strftime("%H:%M:%S")
  end

  def self.shortest_ride
    time = minimum(:duration)
    Time.at(time).utc.strftime("%H:%M:%S")
  end

  def self.most_departed_station
    station_data = station_and_departures
    station_data.max_by do |info|
      info.last
    end.first
  end

  def self.least_departed_station
    station_data = station_and_departures
    station_data.min_by do |name_and_count|
      name_and_count.last
    end.first
  end

  def self.station_and_departures
    group(:start_station_name).count
  end

  def self.most_ridden_bike
    bike_data = bikes_and_uses
    bike_data.max_by do |id_and_count|
      id_and_count.last
    end.first
  end

  def self.least_ridden_bike
    bike_data = bikes_and_uses
    bike_data.min_by do |id_and_count|
      id_and_count.last
    end.first
  end

  def self.bikes_and_uses
    group(:bike_id).count
  end

	def self.ride_count(bike_id)
		bikes_and_uses[bike_id]
	end

  def self.subscription_types_counts
    group(:subscription_type).count
  end

  def self.subscription_types_and_info
#TODO could prob use a reduce method here instead
		subscription_data = {}
    subscription_types_counts.each do |type, count|
      pct_info = ((count.to_f/all.count) * 100).truncate
      subscription_data[type] = { count: count, pct: pct_info }
    end
		subscription_data
  end

  def self.busiest_day
    day_data = days_and_trips
    day_data.max_by do |day_and_count|
      day_and_count.last
    end.first
  end

  def self.slowest_day
    day_data = days_and_trips
    day_data.min_by do |day_and_count|
      day_and_count.last
    end.first
  end

  def self.days_and_trips
#TODO the check that trips dates are saved as YYYY-MM-DD
    group(:start_date).count
  end

end
