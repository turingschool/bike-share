class Subscription < ActiveRecord::Base
  belongs_to :trip

  validates :subscription, presence: true, uniqueness: true
end
