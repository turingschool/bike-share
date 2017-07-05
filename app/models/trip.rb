class Trip < ActiveRecord::Base
  validates_presence_of :duration,
                        :start_date_id,
                        :start_station_id,
                        :end_date_id,
                        :end_station_id,
                        :bike_id,
                        :subscription_type,
                        :zipcode_id


  belongs_to :start_station, class_name: "Station", foreign_key: "start_station_id"
  belongs_to :end_station, class_name: "Station", foreign_key: "end_station_id"
  belongs_to :start_date, class_name: "BikeShareDate", foreign_key: "start_date_id"
  belongs_to :end_date, class_name: "BikeShareDate", foreign_key: "end_date_id"
  belongs_to :zipcode, class_name: "Zipcode", foreign_key: "zipcode_id"

  def self.rides_at_start_station(station_id)
    Trip.where(start_station_id: station_id).count
  end

  def self.rides_at_end_station(station_id)
    Trip.where(end_station_id: station_id).count
  end

  # def self.most_trip_date(station_id)
  #   a = Trip.where(start_station_id: station_id).to_a
  #   b = count_by_start_date(a)
  # end
  #
  def self.count_method(array)
    final ={}
    array.each do |x|
      if final.keys.include?(x)
        final[x] += 1
      else
        final[x] = 1
      end
    end
    return final.sort_by { |k,v| v }.last
  end

  def self.start_station_with_most_rides(station_id)
    destination = Trip.where(start_station_id: station_id)
    array = destination.pluck(:end_station_id).to_a
    end_station = count_method(array).first
    return Trip.find(station_id).start_station
  end

end
