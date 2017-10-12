class Trip < ActiveRecord::Base
  belongs_to :start_station,  class_name: "Station"
  belongs_to :end_station,  class_name: "Station"
  belongs_to :condition,  class_name: "Condition", primary_key: "date", foreign_key: "start_date"

  validates :duration,          presence: true
  validates :start_date,        presence: true
  validates :start_station_name,presence: true
  validates :start_station_id,  presence: true
  validates :end_date,          presence: true
  validates :end_station_name,  presence: true
  validates :end_station_id,    presence: true
  validates :bike_id,           presence: true
  validates :subscription_type, presence: true

  def self.average_ride
    (average("duration")/60).round(2)
  end

  def self.longest_ride
    (maximum(:duration)/86400).round(2)
  end

  def self.shortest_ride
    (minimum(:duration)/60)
  end

  def self.highest_starting_place
    group("start_station_name").order("count_all DESC").count.keys.first
  end

  def self.highest_ending_place
    group("end_station_name").order("count_all DESC").count.keys.first
  end

  def self.monthly_rides(month)
    where("extract(month from start_date) = ?", month).count
  end

  def self.yearly_rides(year)
    where("extract(year from start_date) = ?", year)
          .group("date_part('month', start_date)").count
  end

  def self.most_ridden_bike
    group("bike_id").order("count_all DESC").count.first
  end

  def self.least_ridden_bike
    group("bike_id").order("count_all ASC").count.first
  end

  def self.user_subscription
    group("subscription_type").count
  end

  def self.percentage(subscription_type)
    types = user_subscription
    count = types[subscription_type]
    total = types.values.sum.to_f

    ((count/total)*100).round(2)
  end

  def self.highest_trip_count
    group("start_date").order("count_all DESC").count.first
  end

  def self.lowest_trip_count
    group("start_date").order("count_all ASC").count.first
  end

  def self.highest_number_of_rides
    date = group("start_date").order("count_all DESC").count.keys.first.strftime(format='%Y-%m-%d')
    find_by(start_date: date).condition
  end

  def self.lowest_number_of_rides
    date = group("start_date").order("count_all DESC").count.keys.last.strftime(format='%Y-%m-%d')
    find_by(start_date: date).condition
  end

end
