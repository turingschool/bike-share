class SubscriptionType < ActiveRecord::Base
  has_many :trips

  validates :subscription_type, presence: true, uniqueness: true
  
  def self.total_customers
    SubscriptionType.find_by(subscription_type: "Customer").trips.count
  end
  
  def self.total_subscribers
    SubscriptionType.find_by(subscription_type: "Subscriber").trips.count
  end

  def self.percent_subscription_type(type_total)
    (type_total/Trip.count.to_f * 100).round(2)
  end
  
end
