class Trip < ActiveRecord::Base
  belongs_to :zipcode
  belongs_to :start_station, :foreign_key => :start_station_id, :class_name => 'Station'
  belongs_to :end_station, :foreign_key => :end_station_id, :class_name => 'Station'
  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station_id, presence: true
  validates :end_date, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true

  def format_start_date_time
    start_date.strftime('%m/%d/%Y %H:%M')
  end

  def format_end_date_time
    end_date.strftime('%m/%d/%Y %H:%M')
  end

  def self.average_duration
    Trip.average(:duration).to_f
  end

  def self.longest_ride
    Trip.maximum(:duration)
  end

  def self.shortest_ride
    Trip.minimum(:duration)
  end

  def self.starting_station_most_rides
    (Station.find_by(id: (Trip.group(:start_station_id)).order('count_id DESC').count(:id).first)).name
  end

  def self.ending_station_most_rides
    (Station.find_by(id: (Trip.group(:end_station_id)).order('count_id DESC').count(:id).first)).name
  end

  def self.monthly_ride_breakdown
    year = Trip.
    Trip.where(:start_date.year )
  end

  def self.most_ridden_bike_id
    Trip.group(:bike_id).count.max_by{|bike, count| count}[0]
  end

  def self.most_ridden_bike_rides
    Trip.group(:bike_id).count.max_by{|bike, count| count}[1]
  end

  def self.least_ridden_bike_id
    Trip.group(:bike_id).count.min_by{|bike, count| count}[0]
  end

  def self.least_ridden_bike_rides
    Trip.group(:bike_id).count.min_by{|bike, count| count}[1]
  end

  def self.customer_subscription_count
    Trip.group(:subscription_type).count["Customer"]
  end

  def self.subscriber_subscription_count
    Trip.group(:subscription_type).count["Subscriber"]
  end

  def self.customer_subscription_percentage
    customer_subscription_count / total_subscription_count
  end

  def self.subscriber_subscription_percentage
    subscriber_subscription_count / total_subscription_count
  end

  def self.total_subscription_count
    customer_subscription_count + subscriber_subscription_count
  end
  

end


Trip.where(start_date: (Time.new(2013, 01, 01))..(Time.new(2013, 01, 31)))