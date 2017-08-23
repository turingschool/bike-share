class ConditionsTrips < ActiveRecord::Base
  validates :trip_id, :condition_id, presence: true

  belongs_to :trip
  belongs_to :condition
end
