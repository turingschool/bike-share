class SubscriptionType < ActiveRecord::Base
  has_many :trips

  validates :subscription_type, presence: true, uniqueness: true
end
