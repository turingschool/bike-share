require 'pry'

class Trip < ActiveRecord::Base
  belongs_to :station

  validates_presence_of :duration,
                        :start_date,
                        :start_station_name,
                        :start_station_id,
                        :end_date,
                        :end_station_name,
                        :end_station_id,
                        :bike_id,
                        :subscription_type

  def self.average_ride_duration
    average(:duration).round(2)
  end

  def self.longest_ride
    maximum(:duration)
  end

  def self.shortest_ride
    minimum(:duration)
  end


  def self.total_rides_per_month
    Trip.group("DATE_TRUNC('month',start_date)").count.transform_keys do |key|
      "#{Date::MONTHNAMES[key.month]} #{key.year}"
    end
  end

  def self.total_rides_per_year
    Trip.group("DATE_TRUNC('year',start_date)").count.transform_keys do |key|
      key.year
    end
  end

  def self.most_ridden_bike
    Trip.group(:bike_id).count.invert.max.last
  end

  def self.least_ridden_bike
    Trip.group(:bike_id).count.invert.min.last
  end

  def self.subscription_type_breakout
    Trip.group(:subscription_type).count
  end

  def self.total_subscriptions
    subscription_type_breakout.values.sum
  end

  def self.percentage_subscription_type
    subscription_type_breakout.transform_values do |value|
      value/total_subscriptions.round(2) * 100
    end
  end


end
