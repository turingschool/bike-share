class ConditionsTrips < ActiveRecord::Base

  belongs_to :trip
  belongs_to :condition
end
