class ConditionTrip < ActiveRecord::Base

  belongs_to :trip
  belongs_to :condition
end
