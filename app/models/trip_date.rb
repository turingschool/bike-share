class Trip < ActiveRecord::Base
  has_many :stations
  belongs_to :trip_date
  belongs_to :trip_time
end 
