class Trip < ActiveRecord::Base
  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station, presence: true
  validates :end_date, presence: true
  validates :end_station, presence: true
  validates :trip_bike_id, presence: true
  validates :subscription, presence: true


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
