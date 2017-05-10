class Trip < ActiveRecord::Base
  validates :duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type, presence: true
  belongs_to :start_station, :class_name => "Station"
  belongs_to :end_station, :class_name => "Station"

  def self.get_paginated_trips(params)
    self.order(:start_date).paginate(:page => params[:page], :per_page => 30)
  end
end
