class Trip < ActiveRecord::Base

  validates_presence_of :duration,
                        :start_date,
                        :start_station_name,
                        :start_station_id,
                        :end_date,
                        :end_station_name,
                        :end_station_id,
                        :bike_id,
                        :subscription_type,
                        :zip_code

  belongs_to :start_station, :class_name => 'Station', :foreign_key => 'start_station_id'
  belongs_to :end_station,   :class_name => 'Station', :foreign_key => 'end_station_id'

  def self.average_duration_per_ride
    average(:duration).to_i
  end

  def self.longest_ride
    maximum(:duration)
  end

  def self.shortest_ride
    minimum(:duration)
  end

  def self.start_station_with_most_rides
    station = group(:start_station_id).order("count_id DESC").count(:id).first[0]
    Station.find(station).name
  end

  def self.end_station_with_most_rides
    station = group(:end_station_id).order("count_id DESC").count(:id).first[0]
    Station.find(station).name
  end

  def self.month_by_month
    require 'pry'; binding.pry
    group("DATE_TRUNC('month', start_date)").order("DATE_TRUNC('month', start_date)").count
    #we will need to do some addition work in the view to get formatting correct
  end

  def self.year_by_year
    group("DATE_TRUNC('year', start_date)").order("DATE_TRUNC('year', start_date)").count
    #we will need to do some addition work in the view to get formatting correct
  end

  def self.most_ridden_bike
    group(:bike_id).order("count_bike_id desc").count(:bike_id).first
  end

  def self.least_ridden_bike
    group(:bike_id).order("count_bike_id asc").count(:bike_id).first
  end

  def self.subscription_breakdown
    group(:subscription_type).count
  end

  def self.customer_subscription_percentage
    total_subscriptions = Trip.all.count
    (user_subscription_type_count.values.first.to_f / total_subscriptions.to_f) * 100
  end

  def self.subscriber_subscription_percentage
    total_subscriptions = Trip.all.count
    (user_subscription_type_count.values.last.to_f / total_subscriptions.to_f) * 100
  end


  def self.single_date_with_highest
    group("DATE_TRUNC('day', start_date)").order('count_all desc').count.first
  end

  def self.single_date_with_lowest
    group("DATE_TRUNC('day', start_date)").order('count_all asc').count.first
  end

  def self.number_rides_at_start_station(id)
    where(start_station_id: id).count
  end

  def self.number_rides_at_end_station(id)
    where(end_station_id: id).count
  end

  def self.most_frequent_destination_station(id)
    station_id = where(start_station_id:id).group(:end_station_id).order("count_end_station_id desc").count(:end_station_id).first[0]

    Station.find(station_id).name
  end

  def self.most_frequent_origination_station(id)
    station_id = where(end_station_id:id).group(:start_station_id).order("count_start_station_id desc").count(:start_station_id).first[0]

    Station.find(station_id).name
  end

  def self.date_with_highest_number_trips_started(id)
    dates = where(start_station_id: id).group(:start_date).order(start_date: :desc).count(:start_date)
    dates.first[0].strftime("%Y-%m-%d")
  end

  def self.most_frequent_user_zipcode(id)
    where(start_station_id: id).group(:zip_code).order("count_zip_code desc").count(:zip_code).first[0]
  end

  def self.most_frequent_bike_id(id)
    where(start_station_id: id).group(:bike_id).order("count_bike_id desc").count(:bike_id).first[0]
  end

end
