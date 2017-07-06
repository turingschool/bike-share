class Subscription < ActiveRecord::Base
  has_many :trips

  validates :subscription_type, presence: true

  def self.number_of_subscribers
    where(subscription_type: "Subscriber").count
  end

  def self.number_of_customers
    where(subscription_type: "Customer").count
  end

  def self.percentage_of_subscribers
    total = number_of_subscribers + number_of_customers
    subscribers_percentage = (number_of_subscribers * 100) / total
    subscribers_percentage.to_s + "%"
  end

  def self.percentage_of_customers
    total = number_of_subscribers + number_of_customers
    customers_percentage = (number_of_customers * 100) / total
    customers_percentage.to_s + "%"
  end
end
