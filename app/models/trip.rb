require 'will_paginate'
require 'will_paginate/active_record'

class Trip < ActiveRecord::Base
  belongs_to :station
  belongs_to :station_name
  belongs_to :subscription_type
  belongs_to :zip_code
  belongs_to :bike_share_date

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

  def subscription_type
    SubscriptionType.find(subscription_type_id).name
  end

  def zip_code
    ZipCode.find(zip_code_id).zip_code
  end


  Trip.average(:duration).to_i

  def average_duration_of_a_ride
  end

  def longest_ride
  end

  def shortest_ride
  end

  def most_starting_station_rides
  end

  def most_ending_place_conditions
  end

  def month_by_month_breakdown
      # <h3>Month by Month breakdown of number of rides with subtotals for each year: <%= %></h3>
  end

  def least_ridden_bike
      # <h3>Least ridden bike with total number of rides for that bike: <%= %></h3>
  end

  def most_ridden_bike
    # <h3>Most ridden bike with total number of rides for that bike: <%= %></h3>
  end

  def user_subscription_breakout
    #count and percentage
  end

  def day_of_highest_trips
    # <h3>Single date with the highest number of trips with a count of those trips: <%= %></h3>

  end

  def day_of_lowest_trips
    # <h3>Single date with the lowest number of trips with a count of those trips: <%= %></h3>
  end
end
