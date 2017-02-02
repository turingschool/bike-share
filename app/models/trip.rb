class Trip < ActiveRecord::Base

  belongs_to :bike

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station_id, presence: true
  validates :end_date, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription, presence: true

  def self.find_all_start(id)
    Trip.where(start_station_id: id)
  end

  def self.find_all_end(id)
    Trip.where(start_station_id: id)
  end  

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

  def self.format_time(time)
    a = time.split(":")
    hours = a[0]
    minutes = a[1]
    seconds = a[2]
    "#{hours} hours, #{minutes} minutes and #{seconds} seconds"
  end

  def self.subscription_count_breakdown
    group("subscription").count
  end


  def self.total_subscribers
    pluck("subscription").count
  end


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

  def self.format_time(time)
    a = time.split(":")
    hours = a[0]
    minutes = a[1]
    seconds = a[2]
    "#{hours} hours, #{minutes} minutes and #{seconds} seconds"
  end

  def self.subscriber_count
    where(subscription: "Subscriber").count
  end

  def self.subscriber_percentage
    subscriber = Trip.subscriber_count
    customer = where(subscription: "Customer").count

    total = subscriber/customer
    #total  = Trip.all.count/subscriber
  end
end
