require 'will_paginate'
require 'will_paginate/active_record'

class Trip < ActiveRecord::Base

  validates_presence_of :duration,
                        :start_date,
                        :start_station_name,
                        :end_date,
                        :end_station_name,
                        :bike_id,
                        :subscription

  def self.average_duration
    average(:duration).to_i
  end

  def self.longest_ride
    maximum(:duration)
  end

  def self.shortest_ride
    minimum(:duration)
  end

  def self.popular_starting_place
    group('start_station_name').order('count(*) desc').limit(1).pluck(:start_station_name).first
  end

  def self.least_popular_starting_place
    group('start_station_name').order('count(*) asc').limit(1).pluck(:start_station_name).first
  end

  def self.popular_ending_place
    group('end_station_name').order('count(*) desc').limit(1).pluck(:end_station_name).first
  end

  def self.popular_bike
    group('bike_id').order('count(*) desc').limit(1).pluck(:bike_id).first
  end

  def self.popular_bikes_usage
    group(:bike_id).order('count_id desc').limit(1).count(:id).first[1]
  end

  def self.least_popular_bike
    group('bike_id').order('count(*) asc').limit(1).pluck(:bike_id).first
  end

  def self.least_popular_bikes_usage
    group(:bike_id).order('count_id asc').limit(1).count(:id).first[1]
  end

end
