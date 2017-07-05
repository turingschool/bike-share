require 'will_paginate'
require 'will_paginate/active_record'

class Trip < ActiveRecord::Base
  validates_presence_of :duration, :start_date, :end_date, :start_station_id, :end_station_id, :bike_id, :subscription_id
  belongs_to :subscription

  def self.per_page
    30
  end
end
