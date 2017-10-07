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
