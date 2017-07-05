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

  def self.date_with_most_trips
    most_date = group(:start_date).count.max_by do |date, count|
      count
    end

    {date: most_date[0], count: most_date[1]}
  end

  def self.date_with_least_trips
    least_date = group(:start_date).count.min_by do |date, count|
      count
    end

    {date: least_date[0], count: least_date[1]}
  end

  def self.bike_with_most_rides
    most_bike = group(:bike_id).count.max_by do |bike, count|
      count
    end

    {bike: most_bike[0], count: most_bike[1]}
  end

  def self.bike_with_least_rides
    least_bike = group(:bike_id).count.min_by do |bike, count|
      count
    end

    {bike: least_bike[0], count: least_bike[1]}
  end

  def self.subscription_type
     count = Trip.group(:subscription_type).count.each do |bike, count|
     end

  end
end
