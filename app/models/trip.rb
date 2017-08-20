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
end
