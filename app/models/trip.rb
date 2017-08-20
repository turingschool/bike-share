require 'will_paginate'
require 'will_paginate/active_record'

class Trip < ActiveRecord::Base
  validates :duration, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_station_id, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true

  belongs_to :start_station, class_name: "Station", foreign_key: "start_station_id"
  belongs_to :end_station, class_name: "Station", foreign_key: "end_station_id"

  def self.average_duration_of_a_trip
    a = (Trip.average("duration").to_i) / 60
    b = (Trip.average("duration").to_i) % 60
    "#{a} minutes and #{b} seconds"
  end

end
