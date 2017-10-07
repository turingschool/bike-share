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
      info.values.first
    end.keys.first
  end

  def self.least_departed_station
    station_data = station_and_departures
    station_data.min_by do |name_and_count|
      name_and_count.values.first
    end.keys.first
  end

  def self.station_and_departures
    group(:station_start_name).count
  end

  def self.most_ridden_bike
    bike_data = bikes_and_uses
    bike_data.max_by do |id_and_count|
      id_and_count.values.first
    end.keys.first
  end

  def self.least_ridden_bike
    bike_data = bike_and_uses
    bike_data.min_by do |id_and_count|
      id_and_count.values.first
    end.keys.first
  end

  def self.bikes_and_uses
    group(:bike_id).count
  end

  def self.subscription_types_counts
    group(:subscription_types).count
  end

  def self.subscription_types_and_info
    subscription_data = {}
    subscription_types_counts.each do |type, count|
      pct_info = ((count.to_f/all.count) * 100).truncate(1)
      subscription_data[type] { count: count, pct: pct_info }
    end
  end

  def self.busiest_day
    day_data = days_and_trips
    day_data.max_by do |day_and_count|
      day_and_count.values.first
    end.keys.first
  end

  def self.slowest_day
    day_data = days_and_trips
    day_data.min_by do |day_and_count|
      day_and_count.values.first
    end.keys.first
  end

  def self.days_and_trips
#TODO the check that trips dates are saved as YYYY-MM-DD
    group(:start_date).count
  end

#TODO not active record!!! =[
  # def self.most_departed_station
  #   stations = all_start_stations
  #   info = station_and_departures(stations)
  #   info.max_by { |info| info.values.first }.keys.first
  # end
  #
  # def self.all_start_stations
  #   all.map { |trip| trip[:start_station_name] }.uniq
  # end
  #
  # def self.station_and_departures(stations)
  #   stations.reduce(Hash.new) do |stations_info, station|
  #     stations_info[station] = where(station: station).count
  #   end
  # end
  #
  # def self.least_departed_station
  #   stations = all_start_stations
  #   info = station_and_departures(stations)
  #   info.min_by { |info| info.values.first }.keys.first
  # end

  # def self.most_ridden_bike
  #   get array of bikes
  #   create has with bike ids as keys and ride count as values
  #   max by on that hash
  # end

end
