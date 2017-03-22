class Subscription < ActiveRecord::Base
  has_many :trips

  validates :subscription, presence: true, uniqueness: true
end
