class Subscription < ActiveRecord::Base
  has_many :trips

  validates :subscription, presence: true

  def self.subscriber_totals
    Subscription.find_by(subscription: "Subscriber").trips.count
  end

  def self.customer_totals
    Subscription.find_by(subscription: "Customer").trips.count
  end

  def self.customer_percentage
    (((Subscription.customer_totals) / (Trip.all.count.to_f)) * 100).ceil
  end

  def self.subscriber_percentage
    ((Subscription.subscriber_totals / Trip.all.count.to_f) * 100).ceil
  end
end
