require 'will_paginate'
require 'will_paginate/active_record'

class Trip < ActiveRecord::Base
  belongs_to :station
  belongs_to :station_name
  belongs_to :subscription_type
  belongs_to :zip_code
  belongs_to :bike_share_date

#not sure if works
  # def trip_id
  #   Trip.find(id).trip_id
  # end

  def start_date
    BikeShareDate.find(start_date_id).bike_share_date
  end

  def start_station_name
    StationName.find(start_station_name_id).name
  end

  def end_date
    BikeShareDate.find(end_date_id).bike_share_date
  end

  def end_station_name
    StationName.find(end_station_name_id).name
  end
  #not sure if needed
  # def bike_id
  #   Trip.find(id).bike_id
  # end

  def subscription_type
    SubscriptionType.find(subscription_type_id).name
  end

  def zip_code
    ZipCode.find(zip_code_id).zip_code
  end

end
