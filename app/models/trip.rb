class Trip < ActiveRecord::Base

  validates_presence_of :duration,
                        :start_date,
                        :start_station_id,
                        :end_date,
                        :end_station_id,
                        :bike_id,
                        :subscription_type,
                        :zip_code

  belongs_to :start_station, :class_name => 'Station'
  belongs_to :end_station,   :class_name => 'Station'
  belongs_to :condition, :class_name => "Condition"

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
    #refactor
  end

  def self.end_station_with_most_rides
    station = group(:end_station_id).order("count_id DESC").count(:id).first[0]
    Station.find(station).name
  end

  def self.month_by_month
    group("DATE_TRUNC('month', start_date)").order("DATE_TRUNC('month', start_date)").count
  end

  def self.year_by_year
    group("DATE_TRUNC('year', start_date)").order("DATE_TRUNC('year', start_date)").count
  end

  def self.most_ridden_bike
    group(:bike_id).order("count_bike_id desc").order(bike_id: :desc).count(:bike_id).first
  end

  def self.least_ridden_bike
    group(:bike_id).order("count_bike_id asc").order(bike_id: :asc).count(:bike_id).first
  end

  def self.subscription_breakdown
    group(:subscription_type).order(:subscription_type).count
  end

  def self.customer_subscription_percentage
    (subscription_breakdown.values.first.to_f / all.count.to_f) * 100
  end

  def self.subscriber_subscription_percentage
    (subscription_breakdown.values.last.to_f / all.count.to_f) * 100
  end

  def self.single_date_with_highest
    group("DATE_TRUNC('day', start_date)").order('count_all desc').count.first
  end

  def self.single_date_with_lowest
    group("DATE_TRUNC('day', start_date)").order('count_all asc').count.first
  end

end
