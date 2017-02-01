class Trip < ActiveRecord::Base
  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station, presence: true
  validates :end_date, presence: true
  validates :end_station, presence: true
  validates :trip_bike_id, presence: true
  validates :subscription, presence: true


  def self.average_duration_of_a_ride
    t = (average("duration").round).to_i
    time = Time.at(t).utc.strftime("%H:%M:%S")
    format_time(time)
  end

  def self.longest_ride
    t = maximum("duration").round.to_i
    time = Time.at(t).utc.strftime("%H:%M:%S")
    format_time(time)
  end

  def self.shortest_ride
    t = minimum("duration").round.to_i
    time = Time.at(t).utc.strftime("%H:%M:%S")
    format_time(time)
  end

  # def self.month_by_month_breakdown
  #   #Month by Month breakdown of number of rides with subtotals for each year:
  #
  # end
  #
  # def self
  #
  # end

  def self.subscription_type_count_and_percentage
    Trip.where(subscription: "Customer").count
    Trip.where(subscription: "Subscriber").count
  end

  def self.format_time(time)
    a = time.split(":")
    hours = a[0]
    minutes = a[1]
    seconds = a[2]
    "#{hours} hours, #{minutes} minutes and #{seconds} seconds"
  end


end
